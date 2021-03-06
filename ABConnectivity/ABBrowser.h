//
//  ABSessionBrowser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@class ABPeer;
@protocol ABBrowserDelegate;

@interface ABBrowser : NSObject<MCNearbyServiceBrowserDelegate>

@property (readonly, strong, nonatomic) MCNearbyServiceBrowser *browser;
@property (weak, nonatomic) id<ABBrowserDelegate> delegate;

- (instancetype)initWithPeer:(ABPeer *)peer serviceName:(NSString *)name;

- (void)browse;
- (void)stop;

@end

@protocol ABBrowserDelegate <NSObject>

- (BOOL)shouldInvitePeer: (ABPeer *)peer;
- (void)invitePeer: (ABPeer *)peer;

@end