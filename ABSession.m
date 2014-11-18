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

@property (nonatomic, copy) void (^progressBlock)(ABPeer *);
@property (nonatomic, copy) void (^completionBlock)(NSArray *);

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
}

#pragma mark - MCSessionDelegate methods
// Remote peer changed state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    BOOL foundPeer = NO;
    
    for (ABPeer *peer in self.peers) {
        if ([peer.peerID.displayName isEqualToString: peerID.displayName]) {
            peer.connnectionState = state;
            foundPeer = YES;
        }
    }
   
    if (!foundPeer && [self.peers count] < self.maxNumberOfPeers) {
        
    }
}

// Received data from remote peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {

}

// Received a byte stream from remote peer
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {

}

// Start receiving a resource from remote peer
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {

}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {

}

// Made first contact with peer and have identity information about the remote peer (certificate may be nil)
- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void(^)(BOOL accept))certificateHandler {

}

@end
