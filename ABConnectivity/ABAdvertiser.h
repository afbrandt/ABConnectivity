//
//  ABSessionAdvertiser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@class ABPeer;
@protocol ABAdvertiserDelegate;

@interface ABAdvertiser : NSObject<MCNearbyServiceAdvertiserDelegate>

@property (readonly, strong, nonatomic) MCNearbyServiceAdvertiser *advertiser;
@property (weak, nonatomic) id<ABAdvertiserDelegate> delegate;

- (instancetype)initWithPeer:(ABPeer *)peer serviceName:(NSString *)name;

- (void)advertise;
- (void)stop;

@end

@protocol ABAdvertiserDelegate <NSObject>

- (BOOL)shouldAcceptInviteWithPeer:(ABPeer *)peer;
- (void)acceptInviteWithPeer:(ABPeer *)peer withHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler;

@end