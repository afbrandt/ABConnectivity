//
//  ABSessionAdvertiser.m
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import "ABAdvertiser.h"
#import "ABPeer.h"

@implementation ABAdvertiser

- (instancetype)initWithPeer:(ABPeer *)peer serviceName: (NSString *)name{
    self = [super init];
    
    if (self) {
        _advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:peer.peerID discoveryInfo:peer.info serviceType:name];
    }
    
    return self;
}

#pragma mark - MCServiceNearbyAdvertiserDelegate methods
// Incoming invitation request.  Call the invitationHandler block with YES and a valid session to connect the inviting peer to the session.
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {

}

// Advertising did not start due to an error
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didNotStartAdvertisingPeer:(NSError *)error {

}

@end
