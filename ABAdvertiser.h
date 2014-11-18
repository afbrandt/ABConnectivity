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

@end

@protocol ABAdvertiserDelegate <NSObject>

@end