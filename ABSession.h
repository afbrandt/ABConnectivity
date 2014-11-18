//
//  ABSession.h
//  Pods
//
//  Created by Andrew Brandt on 11/17/14.
//
//

#import <Foundation/Foundation.h>
#import "ABAdvertiser.h"
#import "ABBrowser.h"
@class ABPeer;

@interface ABSession : NSObject<ABBrowserDelegate, ABAdvertiserDelegate>

@property (readonly, strong, nonatomic) ABAdvertiser *advertiser;
@property (readonly, strong, nonatomic) ABBrowser *browser;
@property (readonly, strong, nonatomic) NSString *serviceName;
@property (strong, nonatomic) NSArray *peers;

- (void)connectToPeersWithMax:(NSInteger)number progressBlock:(void (^)(ABPeer *peer))progress completionBlock:(void (^)(NSArray *peers))complete;

@end
