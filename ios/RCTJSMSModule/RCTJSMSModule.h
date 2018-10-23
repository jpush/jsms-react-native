//
//  RCTJSMSModule.h
//  RCTJSMSModule
//
//  Created by oshumini on 2018/10/23.
//  Copyright © 2018 HXHG. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#elif __has_include("React/RCTBridgeModule.h")
#import "React/RCTBridgeModule.h"
#endif

@interface RCTJSMSModule : NSObject<RCTBridgeModule>

@end
