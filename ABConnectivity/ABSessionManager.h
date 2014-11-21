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
#import "ABSession.h"


@interface ABSessionManager : NSObject

@property (nonatomic, strong) ABAdvertiser *advertiser;
@property (nonatomic, strong) ABBrowser *browser;
@property (nonatomic, strong) ABPeer *peer;
@property (nonatomic, strong) NSMutableArray *sessions;

- (instancetype)initWithPeer: (ABPeer *)peer;

- (ABSession *)createSessionWithServiceName: (NSString *)name;

@end

@protocol ABSessionManagerDelegate <NSObject>

@optional

@end