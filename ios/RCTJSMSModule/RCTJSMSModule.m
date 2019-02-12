//
//  RCTJSMSModule.m
//  RCTJSMSModule
//
//  Created by oshumini on 2018/10/23.
//  Copyright © 2018 HXHG. All rights reserved.
//

#import "RCTJSMSModule.h"
#import "JSMSSDK.h"

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

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (id)init {
  self = [super init];
  return self;
}

- (NSDictionary *)errorToDic: (NSError *)error {
  return @{@"code": @(error.code), @"description": [error description]};
}

RCT_EXPORT_METHOD(setup: (NSString *)appKey) {
  if (appKey != nil && ![appKey isEqualToString:@""]) {
    [JSMSSDK registerWithAppKey: appKey];
  } else {
    // 如果 appKey 为空，会尝试在 JiGuangConfig.plist 文件中查找这个 appKey。
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"JiGuangConfig" ofType:@"plist"];
    
    if (!plistPath) {
      NSLog(@"error: JiGuangConfig.plist not found");
      return;
    }
    
    NSMutableDictionary *fileConfig = [[NSMutableDictionary alloc] initWithContentsOfFile: plistPath];
    if (fileConfig[@"appKey"]) {
      [JSMSSDK registerWithAppKey: fileConfig[@"appKey"]];
    }
  }
}


RCT_EXPORT_METHOD(getVerificationCode: (NSDictionary *)params
                  success: (RCTResponseSenderBlock)successCallback
                  fail: (RCTResponseSenderBlock)failCallback) {
  
  [JSMSSDK getVerificationCodeWithPhoneNumber: params[@"number"]
                                andTemplateID: params[@"templateId"]
                            completionHandler:^(id  _Nullable resultObject, NSError * _Nullable error) {
                              if (error) {
                                failCallback(@[[self errorToDic: error]]);
                                return;
                              }
                              
                              successCallback(@[]);
                            }];
}


RCT_EXPORT_METHOD(getVoiceVerificationCode: (NSDictionary *)params
                  success: (RCTResponseSenderBlock)successCallback
                  fail: (RCTResponseSenderBlock)failCallback) {
  JSMSLanguageOptions language;
  if ([params[@"number"] isEqualToString:@"en"]) {
    language = JSMSLanguage_en;
  } else {
    language = JSMSLanguage_zh_Hans;
  }
  
  [JSMSSDK getVoiceVerificationCodeWithPhoneNumber: params[@"number"]
                                   languageOptions: language
                                 completionHandler:^(id  _Nullable resultObject, NSError * _Nullable error) {
                                   if (error) {
                                     failCallback(@[[self errorToDic: error]]);
                                     return;
                                   }
                                   
                                   successCallback(@[]);
                                 }];
}

RCT_EXPORT_METHOD(checkVerificationCode: (NSDictionary *)params
                  success: (RCTResponseSenderBlock)successCallback
                  fail: (RCTResponseSenderBlock)failCallback) {
  [JSMSSDK commitWithPhoneNumber: params[@"number"]
                verificationCode: params[@"code"]
               completionHandler:^(id  _Nullable resultObject, NSError * _Nullable error) {
                 if (error) {
                   failCallback(@[[self errorToDic: error]]);
                   return;
                 }
                 successCallback(@[]);
               }];
}

RCT_EXPORT_METHOD(setMinimumTimeInterval: (nonnull NSNumber *)interval) {
  [JSMSSDK setMinimumTimeInterval: interval.doubleValue];
}
@end
