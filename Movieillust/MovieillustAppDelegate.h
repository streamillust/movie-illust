//
//  MovieillustAppDelegate.h
//  Movieillust
//
//  Created by Yoon Danny on 8/9/11.
//  Copyright 2011 NET. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STTableViewController;

@interface MovieillustAppDelegate : NSObject <UIApplicationDelegate> {
    STTableViewController *_tableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
