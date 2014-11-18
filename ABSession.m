//
//  ABSession.m
//  Pods
//
//  Created by Andrew Brandt on 11/17/14.
//
//

#import "ABSession.h"

@interface ABSession ()



@end

@implementation ABSession

- (instancetype)initWithPeer: (ABPeer *)peer serviceName: (NSString *)name {
    self = [super init];
    
    if (self) {
        _serviceName = name;
        _advertiser = [[ABAdvertiser alloc] initWithPeer:peer serviceName:name];
        _browser = [[ABBrowser alloc] init];
        _peers = [NSArray array];
    }
    
    return self;
}

- (void)connectToPeersWithMax:(NSInteger)number progressBlock:(void (^)(ABPeer *))progress completionBlock:(void (^)(NSArray *))complete {

}

@end
