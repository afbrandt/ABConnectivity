//
//  ABSessionBrowser.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ABBrowser : NSObject<MCNearbyServiceBrowserDelegate>

@end

@protocol ABBrowserDelegate <NSObject>

@end