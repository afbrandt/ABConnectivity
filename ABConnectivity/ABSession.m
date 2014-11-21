//
//  ABSession.m
//  Pods
//
//  Created by Andrew Brandt on 11/17/14.
//
//

#import "ABSession.h"
#import "ABPeer.h"

@interface ABSession ()

//peer connection callbacks
@property (nonatomic, copy) void (^progressBlock)(ABPeer *);
@property (nonatomic, copy) void (^completionBlock)(NSArray *);
//incoming data/stream callbacks
@property (nonatomic, copy) void (^dataHandler)(NSData *data, MCPeerID *peerID);
@property (nonatomic, copy) void (^streamHandler)(NSInputStream *stream, NSString *streamName, MCPeerID *peerID);
//incoming resource callback
@property (nonatomic, copy) void (^resourceProgressHandler)(NSString *resourceName, MCPeerID *peerID, NSProgress *progress);
@property (nonatomic, copy) void (^resourceCompleteHandler)(NSString *resourceName, MCPeerID *peerID, NSURL *localURL, NSError *error);

@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCPeerID *localPeerID;

@property (nonatomic, assign) NSInteger maxNumberOfPeers;

@end

@implementation ABSession

- (instancetype)initWithPeer: (ABPeer *)peer serviceName: (NSString *)name {
    self = [super init];
    
    if (self) {
        _serviceName = name;
        _advertiser = [[ABAdvertiser alloc] initWithPeer:peer serviceName:name];
        _browser = [[ABBrowser alloc] initWithPeer:peer serviceName:name];
        _peers = [NSArray array];
    }
    
    return self;
}

- (void)connectToPeersWithMax:(NSInteger)number progressBlock:(void (^)(ABPeer *))progress completionBlock:(void (^)(NSArray *))complete {
    self.progressBlock = progress;
    self.completionBlock = complete;
    self.maxNumberOfPeers = number;
    
    //start advertising and browsing
    [self.advertiser advertise];
    [self.browser browse];
}

- (void)stopConnectingToPeers {
    [self.advertiser stop];
    [self.browser stop];
}

- (void)endSession {
    [self stopConnectingToPeers];
    [self.session disconnect];
    //self.session = nil;
}

- (NSOutputStream *)createStreamWithName:(NSString *)name withPeer:(ABPeer *)peer error:(NSError *__autoreleasing *)error {
    return nil;
}

- (NSProgress *)sendResourceAtURL:(NSURL *)location withName:(NSString *)resourceName toPeer:(ABPeer *)peer withCompletionHandler:(void (^)(NSError *))handler {
    return nil;
}

- (void)sendData:(NSData *)data toPeers:(NSArray *)peers {

}

#pragma mark - Incoming data callback block initialization methods

- (void)allowDataWithCallback:(void (^)(NSData *, MCPeerID *))dataHandler {
    self.dataHandler = dataHandler;
}

- (void)allowStreamWithCallback:(void (^)(NSInputStream *, NSString *, MCPeerID *))streamHandler {
    self.streamHandler = streamHandler;
}

- (void)allowResourceWithProgress:(void (^)(NSString *, MCPeerID *, NSProgress *))resourceProgress complete:(void (^)(NSString *, MCPeerID *, NSURL *, NSError *))complete {
    self.resourceProgressHandler = resourceProgress;
    self.resourceCompleteHandler = complete;
}

#pragma mark - MCSessionDelegate methods
// Remote peer changed state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    BOOL foundPeer = NO;
    
    for (ABPeer *peer in self.peers) {
        if ([peer.peerID.displayName isEqualToString: peerID.displayName]) {
            foundPeer = YES;
        }
    }
   
    if (!foundPeer && [self.peers count] < self.maxNumberOfPeers) {
        
    }
}

// Received data from remote peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSAssert(self.dataHandler != nil, @"Received data without handler!");
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        self.dataHandler(data, peerID);
    });
}

// Received a byte stream from remote peer
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    NSAssert(self.streamHandler != nil, @"Received stream without handler!");
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        self.streamHandler(stream, streamName, peerID);
    });
}

// Start receiving a resource from remote peer
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    NSAssert(self.resourceProgressHandler != nil , @"Receiving resource without handler!");
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        self.resourceProgressHandler(resourceName, peerID, progress);
    });

}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    NSAssert(self.resourceCompleteHandler != nil , @"Received resource without handler!");
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        self.resourceCompleteHandler(resourceName, peerID, localURL, error);
    });
}

// Made first contact with peer and have identity information about the remote peer (certificate may be nil)
- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void(^)(BOOL accept))certificateHandler {
    certificateHandler(YES);
}

#pragma mark - ABAdvertiserDelegate methods

- (BOOL)shouldAcceptInviteWithPeer:(ABPeer *)peer {
    return YES;
}

- (void)acceptInviteWithPeer:(ABPeer *)peer withHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {
    
}

#pragma mark - ABBrowserDelegate methods

- (BOOL)shouldInvitePeer: (ABPeer *)peer{
    return YES;
}
- (void)invitePeer: (ABPeer *)peer {
    
}

@end
