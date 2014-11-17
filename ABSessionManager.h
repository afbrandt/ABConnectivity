//
//  ABSessionManager.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ABSessionManager : NSObject<MCSessionDelegate>

@end

@protocol ABSessionManagerDelegate <NSObject>

@optional

@end