//
//  ABViewController.h
//  ABConnectivity
//
//  Created by Andrew Brandt on 11/13/2014.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ABSession;

@interface ABViewController : UIViewController

@property (strong, nonatomic) ABSession *session;

@end
