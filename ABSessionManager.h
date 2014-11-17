//
//  ABSessionManager.h
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "ABAdvertiser.h"
#import "ABBrowser.h"

@interface ABSessionManager : NSObject<MCSessionDelegate, ABBrowserDelegate, ABAdvertiserDelegate>

@property (nonatomic, strong) ABAdvertiser *advertiser;
@property (nonatomic, strong) ABBrowser *browser;

@end

@protocol ABSessionManagerDelegate <NSObject>

@optional

@end