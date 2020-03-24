//
//  AppDelegate.m
//  Segment-Adobe-Analytics_TVOS
//
//  Created by Brienne McNally on 3/23/20.
//  Copyright © 2020 ladanazita. All rights reserved.
//

#import "AppDelegate.h"
#import "SEGAdobeIntegrationFactory.h"
#import <Analytics/SEGAnalytics.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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
