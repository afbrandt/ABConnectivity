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

@interface ABSession : NSObject<ABBrowserDelegate, ABAdvertiserDelegate, MCSessionDelegate>

@property (readonly, strong, nonatomic) ABAdvertiser *advertiser;
@property (readonly, strong, nonatomic) ABBrowser *browser;
@property (readonly, strong, nonatomic) NSString *serviceName;
@property (strong, nonatomic) NSArray *peers;

- (instancetype)initWithPeer:(ABPeer *)peer serviceName:(NSString *)name;

- (void)connectToPeersWithMax:(NSInteger)number progressBlock:(void (^)(ABPeer *peer))progress completionBlock:(void (^)(NSArray *peers))complete;
- (void)stopConnectingToPeers;
- (void)endSession;

//incoming methods
- (void)allowDataWithCallback:(void (^)(NSData *data, MCPeerID *peerID))dataHandler;
- (void)allowStreamWithCallback:(void (^)(NSInputStream *stream, NSString *streamName, MCPeerID *peerID))streamHandler;
- (void)allowResourceWithProgress:(void (^)(NSString *resourceName, MCPeerID *peerID, NSProgress *progress))resourceProgress complete:(void (^)(NSString *resourceName, MCPeerID *peerID, NSURL *localURL, NSError *error))complete;

//outgoing methods
- (void)sendData:(NSData *)data toPeers:(NSArray *)peers;
- (NSProgress *)sendResourceAtURL:(NSURL *)location withName:(NSString *)resourceName toPeer:(ABPeer *)peer withCompletionHandler:(void(^)(NSError *error))handler;
- (NSOutputStream *)createStreamWithName:(NSString *)name withPeer:(ABPeer *)peer error:(NSError **)error;

@end
