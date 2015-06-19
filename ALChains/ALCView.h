//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import "ALCAppKitOrUIKit.h"

/** Defines 'ALCView' which maps to UIView on iOS, NSView on Mac */
#if TARGET_OS_IPHONE
#define ALCView UIView
#elif TARGET_OS_MAC
#define ALCView NSView
#endif
