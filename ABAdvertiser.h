//
//  ABSessionAdvertiser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@protocol ABAdvertiserDelegate;

@interface ABAdvertiser : NSObject<MCNearbyServiceAdvertiserDelegate>

@property (weak, nonatomic) id<ABAdvertiserDelegate> delegate;

@end


@protocol ABAdvertiserDelegate <NSObject>

@end