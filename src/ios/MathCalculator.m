/********* MathCalculator.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface MathCalculator : CDVPlugin {
  // Member variables go here.
}
- (void)add:(CDVInvokedUrlCommand*)command;
@end

@implementation MathCalculator


- (void)add:(CDVInvokedUrlCommand*)command{


    [self sendBackgroundLocationToServer:command]
}


- (void) sendBackgroundLocationToServer: (CDVInvokedUrlCommand *) command
{

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success"];
    
    UIBackgroundTaskIdentifier bgTask = UIBackgroundTaskInvalid;
    bgTask = [[UIApplication sharedApplication]
         beginBackgroundTaskWithExpirationHandler:^{
             [[UIApplication sharedApplication] endBackgroundTask:bgTask];
    }];

   
   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    // send to server with a synchronous request

    // AFTER ALL THE UPDATES, close the task
    if (bgTask != UIBackgroundTaskInvalid)
    {
        [[UIApplication sharedApplication] endBackgroundTask:bgTask];
    }
}

@end
