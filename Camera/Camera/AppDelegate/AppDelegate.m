//
//  AppDelegate.m
//  Camera
//
//  Created by Victoria on 01.03.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "AppDelegate.h"
#import "VYKMainViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) VYKMainViewController *rootViewController;
@property (nonatomic, strong) UINavigationController *navigationControloler;

@end

@implementation AppDelegate


#pragma  mark - app delegate metods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initWindow];
    
    return YES;
}


#pragma mark - init navigation controller

- (void)initNavigationController
{
    self.rootViewController = [[VYKMainViewController alloc]
                               initWithNibName:nil bundle:nil];
    self.navigationControloler = [[UINavigationController alloc]
                                  initWithRootViewController:self.rootViewController];
    
    self.window.rootViewController = self.navigationControloler;
    [self.window addSubview:self.navigationControloler.view];
}


# pragma mark - init window

- (void)initWindow
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.tintColor = [UIColor blackColor];
    
    [self initNavigationController];
    [self.window makeKeyAndVisible];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Camera"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
