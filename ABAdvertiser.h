//
//  ABSessionAdvertiser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ABAdvertiser : NSObject<MCNearbyServiceAdvertiserDelegate>

@end

@protocol ABAdvertiserDelegate <NSObject>

@end