// Hive Pingu Service
// Copyright (C) 2008-2012 Hive Solutions Lda.
//
// This file is part of Hive Pingu Service.
//
// Hive Pingu Service is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Hive Pingu Service is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Hive Pingu Service. If not, see <http://www.gnu.org/licenses/>.

// __author__    = João Magalhães <joamag@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision$
// __date__      = $LastChangedDate$
// __copyright__ = Copyright (c) 2008-2012 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // initializes the default values in the preferences structure
    // in case they don't already exist (and are defined)
    [self setDefaults];
    
    // initializes the various layout relates structures, configuring
    // them to the expected behavior
    [self setLayout];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)setDefaults {
}

- (void)setLayout {
    // retrieves the header background image and sets it in the global reference
    // for the navigation bar (global update)
    UIImage *headerBackgroundImage = [UIImage imageNamed:@"header-background.png"];
    UIImage *headerBackgroundImageSmall = [UIImage imageNamed:@"header-background-small.png"];
    [[UINavigationBar appearance] setBackgroundImage:headerBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:headerBackgroundImageSmall forBarMetrics:UIBarMetricsLandscapePhone];
    
    // sets the bar style for the global appearence as black opaque so that the
    // characters are correctly rendered
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    
    // retrieves the various button related images for the button and the
    // back button and sets them in the global appearence object so that
    // the naviation controller's buttons are affected by the behavior
    UIImage *buttonImage = [[UIImage imageNamed:@"button-gray.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
    UIImage *buttonImagePressed = [[UIImage imageNamed:@"button-gray-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
    UIImage *buttonImageSmall = [[UIImage imageNamed:@"button-gray-small.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
    UIImage *buttonImageSmallPressed = [[UIImage imageNamed:@"button-gray-small-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
    UIImage *backImage = [[UIImage imageNamed:@"button-back-gray.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 6)];
    UIImage *backImagePressed = [[UIImage imageNamed:@"button-back-gray-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 6)];
    UIImage *backImageSmall = [[UIImage imageNamed:@"button-back-gray-small.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 6)];
    UIImage *backImageSmallPressed = [[UIImage imageNamed:@"button-back-gray-small-pressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 6)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImagePressed forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImageSmall forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImageSmallPressed forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
    [[UIBarButtonItem appearance] setBackgroundImage:buttonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackgroundImage:buttonImagePressed forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackgroundImage:buttonImageSmall forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    [[UIBarButtonItem appearance] setBackgroundImage:buttonImageSmallPressed forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
}

@end
