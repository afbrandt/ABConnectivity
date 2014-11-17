//
//  ABSessionAdvertiser.m
//  Pods
//
//  Created by Andrew Brandt on 11/13/14.
//
//

#import "ABSessionAdvertiser.h"

@implementation ABSessionAdvertiser

#pragma mark - MCServiceNearbyAdvertiserDelegate methods
// Incoming invitation request.  Call the invitationHandler block with YES and a valid session to connect the inviting peer to the session.
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {

}

// Advertising did not start due to an error
- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didNotStartAdvertisingPeer:(NSError *)error {

}

@end
