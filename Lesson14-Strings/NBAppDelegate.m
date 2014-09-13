//
//  NBAppDelegate.m
//  Lesson14-Strings
//
//  Created by Nick Bibikov on 9/13/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import "NBAppDelegate.h"

@implementation NBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //-------------------------------------------------------------------------------
    
    NSString* string = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eorum enim est haec querela, qui sibi cari sunt seseque diligunt. Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? Luxuriam non reprehendit, modo sit vacua infinita cupiditate et timore. Ex rebus enim timiditas, non ex vocabulis nascitur. Erit enim mecum, si tecum erit. Ita graviter et severe voluptatem secrevit a bono. Often a better and easier alternative to making a subclass of NSString or of any other abstract, public class of a class cluster, for that matter—is object composition. This is especially the case when your intent is to add to the subclass metadata or some other attribute that is not essential to a string object. In object composition, you would have an NSString object as one instance variable of your custom class (typically a subclass of NSObject) and one or more instance variables that store the metadata that you want for the custom object. Then just design your subclass interface to include accessor methods for the embedded string object and the metadata. If the behavior you want to add supplements that of the existing class, you could write a category on NSString. Keep in mind, however, that this category will be in effect for all instances of NSString that you use, and this might have unintended consequences.";

#pragma mark - Learner
    
    NSRange range = [string rangeOfString:@"NSString object as"];
    
    if (range.location != NSNotFound) {
        NSLog(@"-----------------------------------Learner--------------------------------------------");
        NSString* string1 = [string substringToIndex:range.location];
        NSLog(@"%@", string1);
        NSLog(@"-------------------------------------------------------------------------------");
        
        NSString* string2 = [string substringFromIndex:range.location];
        NSLog(@"%@", string2);
    } else {
        NSLog(@"--String not found!");
    }
    
    NSLog(@"-------------------------------------Create array------------------------------------------");
    
    
    NSArray* array = [string componentsSeparatedByString:@"."];
    NSLog(@"%@", array);
    
    
#pragma mark - Student
    
    NSMutableArray* arrayWithNSString = [[NSMutableArray alloc] init];
    
    for (id element in array) {
        if ([element rangeOfString:@"NSString"].location != NSNotFound) {
            [arrayWithNSString addObject:element];
        }
    }
    NSLog(@"-----------------------------------Student--------------------------------------------");
    NSLog(@"%@", arrayWithNSString);
    
    
#pragma mark - Master
    
    NSMutableArray* arrayMaster = [[NSMutableArray alloc] init]; //Master array with reverse strings
    NSMutableArray* arrayForReverse = [[NSMutableArray alloc] init]; //Array for reverse strings
    NSMutableString* stringMaster = [[NSMutableString alloc] init];
    
    
    for (NSString* element in arrayWithNSString) {
        arrayForReverse = (NSMutableArray*) [element componentsSeparatedByString:@" "];
        for (NSString* word in [arrayForReverse reverseObjectEnumerator]) {
            [stringMaster appendFormat:@"%@ ", word];
        }
        [arrayMaster addObject:stringMaster];
    }
    
    NSLog(@"-----------------------------------Master--------------------------------------------");    
    NSLog(@"%@", arrayMaster);
    
    
    //-------------------------------------------------------------------------------
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
