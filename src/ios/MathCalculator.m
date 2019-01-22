/********* MathCalculator.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface MathCalculator : CDVPlugin {
  // Member variables go here.
}
- (void)add:(CDVInvokedUrlCommand*)command;
@end

@implementation MathCalculator


- (void)add:(CDVInvokedUrlCommand*)command{

    [self startBackgroundHandling:command];
}


- (void) startBackgroundHandling: (CDVInvokedUrlCommand *) command
{

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success occured"];
    
    UIBackgroundTaskIdentifier bgTask = UIBackgroundTaskInvalid;
    bgTask = [[UIApplication sharedApplication]
         beginBackgroundTaskWithExpirationHandler:^{
              
    }];
   
   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    // send to server with a synchronous request

    // AFTER ALL THE UPDATES, close the task
    // if (bgTask != UIBackgroundTaskInvalid)
    // {
    //     [[UIApplication sharedApplication] endBackgroundTask:bgTask];
    // }
}

@end
