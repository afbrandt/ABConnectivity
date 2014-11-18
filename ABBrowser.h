//
//  ABSessionBrowser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@protocol ABBrowserDelegate;

@interface ABBrowser : NSObject<MCNearbyServiceBrowserDelegate>

@property (weak, nonatomic) id<ABBrowserDelegate> delegate;

@end


@protocol ABBrowserDelegate <NSObject>

@end