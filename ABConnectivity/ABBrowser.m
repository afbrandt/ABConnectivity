//
//  ABSessionBrowser.m
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import "ABBrowser.h"
#import "ABPeer.h"

@implementation ABBrowser

- (instancetype)initWithPeer:(ABPeer *)peer serviceName: (NSString *)name{
    self = [super init];
    
    if (self) {
        _browser = [[MCNearbyServiceBrowser alloc] initWithPeer:peer.peerID serviceType:name];
        _browser.delegate = self;
    }
    return self;
}

- (void)browse {
    [self.browser startBrowsingForPeers];
}

- (void)stop {
    [self.browser stopBrowsingForPeers];
}

#pragma mark - MCNearbyServiceBrowserDelegate methods

// Found a nearby advertising peer
- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {
    ABPeer *peer = [[ABPeer alloc] initWithPeerID:peerID discoveryInfo:info];
    if ([self.delegate shouldInvitePeer:peer]) {
        [self.delegate invitePeer:peer];
    }
}

// A nearby peer has stopped advertising
- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID {
}

// Browsing did not start due to an error
- (void)browser:(MCNearbyServiceBrowser *)browser didNotStartBrowsingForPeers:(NSError *)error {
}

@end
