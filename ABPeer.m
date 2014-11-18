//
//  ABPeer.m
//  Pods
//
//  Created by Andrew Brandt on 11/17/14.
//
//

#import "ABPeer.h"

@implementation ABPeer

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _peerID = [[MCPeerID alloc] initWithDisplayName:name];
        _info = nil;
        _connnectionState = MCSessionStateNotConnected;
    }
    
    return self;
}

@end
