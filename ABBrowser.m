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
    }
    
    return self;
}

#pragma mark - MCNearbyServiceBrowserDelegate methods

// Found a nearby advertising peer
- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {

}

// A nearby peer has stopped advertising
- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID {

}

// Browsing did not start due to an error
- (void)browser:(MCNearbyServiceBrowser *)browser didNotStartBrowsingForPeers:(NSError *)error {

}

@end
