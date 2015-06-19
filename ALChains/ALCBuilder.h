//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCView.h"


@interface ALCBuilder : NSObject

- (instancetype)initWithView:(ALCView *)view;

- (ALCBuilder *)widthEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)widthEqualTo:(CGFloat)width;

- (ALCBuilder *)heightEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)heightEqualTo:(CGFloat)height;

- (ALCBuilder *)centerXWithOffset:(CGFloat)offset;
- (ALCBuilder *)centerYWithOffset:(CGFloat)offset;

- (ALCBuilder *)heightConstrainedByAspectRatio:(CGFloat)aspectRatio;
- (ALCBuilder *)widthConstrainedByAspectRatio:(CGFloat)aspectRatio;

- (ALCBuilder *)topEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)topEqualTo:(CGFloat)value;
- (ALCBuilder *)rightEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)rightEqualTo:(CGFloat)value;
- (ALCBuilder *)bottomEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)bottomEqualTo:(CGFloat)value;
- (ALCBuilder *)leftEqualToView:(ALCView *)view offset:(CGFloat)offset;
- (ALCBuilder *)leftEqualTo:(CGFloat)value;

/** Build array of constraints */
- (NSArray *)constraints;

@end
