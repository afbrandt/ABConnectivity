//
//  ABSessionManager.m
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import "ABSessionManager.h"

@interface ABSessionManager ()

@end

@implementation ABSessionManager

#pragma mark - Lifecycle methods

- (instancetype)initWithPeer:(ABPeer *)peer {
    self = [super init];
    
    if (self) {
        _sessions = [NSMutableArray array];
        _peer = peer;
    }
    
    return self;
}

- (ABSession *)createSessionWithServiceName:(NSString *)name {
    ABSession *session = [[ABSession alloc] initWithPeer:self.peer serviceName:name];
    [self.sessions addObject:session];
    return session;
}


#pragma mark - MCSessionDelegate methods
// Remote peer changed state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {

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
