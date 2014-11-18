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

@property (strong, nonatomic) ABAdvertiser *advertiser;
@property (strong, nonatomic) ABBrowser *browser;
@property (strong, nonatomic) NSArray *peers;
@property (readonly, nonatomic) NSString *serviceName;

- (void)connectToPeersWithMax:(NSInteger)number progressBlock:(void (^)(ABPeer *peer))progress completionBlock:(void (^)(NSArray *peers))complete;

@end
