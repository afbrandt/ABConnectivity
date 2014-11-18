//
//  ABPeer.h
//  Pods
//
//  Created by Andrew Brandt on 11/17/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ABPeer : NSObject

@property (readonly, nonatomic) MCPeerID *peerID;
@property (assign, nonatomic) MCSessionState connnectionState;
@property (strong, nonatomic) NSDictionary *info;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name discoveryInfo:(NSDictionary *)info;

- (instancetype)initWithPeerID:(MCPeerID *)peerID;
- (instancetype)initWithPeerID:(MCPeerID *)peerID discoveryInfo:(NSDictionary *)info;
@end
