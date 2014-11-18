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

- (instancetype)initWithName:(NSString *)name discoveryInfo:(NSDictionary *)info {
    self = [super init];
    
    if (self) {
        _peerID = [[MCPeerID alloc] initWithDisplayName:name];
        _info = info;
        _connnectionState = MCSessionStateNotConnected;
    }
    
    return self;
}

- (instancetype)initWithPeerID:(MCPeerID *)peerID {
    self = [super init];
    
    if (self) {
        _peerID = peerID;
        _info = nil;
        _connnectionState = MCSessionStateNotConnected;
    }
    
    return self;
}

- (instancetype)initWithPeerID:(MCPeerID *)peerID discoveryInfo:(NSDictionary *)info {
    self = [super init];
    
    if (self) {
        _peerID = peerID;
        _info = info;
        _connnectionState = MCSessionStateNotConnected;
    }
    
    return self;
}


@end
