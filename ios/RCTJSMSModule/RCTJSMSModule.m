//
//  RCTJSMSModule.m
//  RCTJSMSModule
//
//  Created by oshumini on 2018/10/23.
//  Copyright © 2018 HXHG. All rights reserved.
//

#import "RCTJSMSModule.h"

#if __has_include(<React/RCTBridge.h>)
#import <React/RCTEventDispatcher.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#elif __has_include("RCTBridge.h")
#import "RCTEventDispatcher.h"
#import "RCTRootView.h"
#import "RCTBridge.h"
#elif __has_include("React/RCTBridge.h")
#import "React/RCTEventDispatcher.h"
#import "React/RCTRootView.h"
#import "React/RCTBridge.h"
#endif

@implementation RCTJSMSModule
RCT_EXPORT_MODULE();
@synthesize bridge = _bridge;

+ (id)allocWithZone:(NSZone *)zone {
  static RCTJSMSModule *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}

- (id)init {
  self = [super init];

  return self;
}

RCT_EXPORT_METHOD(getVerificationCode:(NSDictionary *)params
                  success:(RCTResponseSenderBlock)successCallback
                  fail: (RCTResponseSenderBlock)successCallback {

}
@end
