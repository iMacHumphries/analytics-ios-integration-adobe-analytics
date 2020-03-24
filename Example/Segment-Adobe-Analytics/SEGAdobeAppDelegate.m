//
//  SEGAdobeAppDelegate.m
//  Segment-Adobe-Analytics
//
//  Created by ladanazita on 11/07/2017.
//  Copyright (c) 2017 ladanazita. All rights reserved.
//

#import "SEGAdobeAppDelegate.h"
#import "SEGAdobeIntegrationFactory.h"
#import <Analytics/SEGAnalytics.h>



@implementation SEGAdobeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:@"YOUR_WRITE_KEY_HERE"];
    
    [config use:[SEGAdobeIntegrationFactory instance]];
    [SEGAnalytics setupWithConfiguration:config];
    [[SEGAnalytics sharedAnalytics] track:@"Video Playback Started"];
    [[SEGAnalytics sharedAnalytics] track:@"Video Content Started"
                               properties: @{ @"full_episode": @true }
                                  options: @{
                                      @"integrations": @{}
                                  }];
    
    [[SEGAnalytics sharedAnalytics] flush];
    [SEGAnalytics debug:YES];
    return YES;
}

@end
