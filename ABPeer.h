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
@property (readonly, nonatomic) NSDictionary *info;
@property (readonly, nonatomic) MCSessionState connnectionState;

@end
