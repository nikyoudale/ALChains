//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCView.h"


@interface ALChainsImpl : NSObject

- (instancetype)initWithView:(ALCView *)view;

/** Make the view fill it's parent view */
@property (readonly, nonatomic) ALChainsImpl *(^fill)();

@property (readonly, nonatomic) ALChainsImpl *(^widthEqualTo)(CGFloat width);
@property (readonly, nonatomic) ALChainsImpl *(^heightEqualTo)(CGFloat height);

/** Make view's width match width of other view */
@property (readonly, nonatomic) ALChainsImpl *(^widthEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^widthEqualToViewOffset)(ALCView *view, CGFloat offset);

/** Make view's height match height of other view */
@property (readonly, nonatomic) ALChainsImpl *(^heightEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^heightEqualToViewOffset)(ALCView *view, CGFloat offset);

@property (readonly, nonatomic) ALChainsImpl *(^heightConstrainedByAspectRatio)(CGFloat aspectRatio);
@property (readonly, nonatomic) ALChainsImpl *(^widthConstrainedByAspectRatio)(CGFloat aspectRatio);

@property (readonly, nonatomic) ALChainsImpl *(^topEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^topEqualToViewOffset)(ALCView *view, CGFloat offset);

@property (readonly, nonatomic) ALChainsImpl *(^rightEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^rightEqualToViewOffset)(ALCView *view, CGFloat offset);

@property (readonly, nonatomic) ALChainsImpl *(^bottomEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^bottomEqualToViewOffset)(ALCView *view, CGFloat offset);

@property (readonly, nonatomic) ALChainsImpl *(^leftEqualToView)(ALCView *view);
@property (readonly, nonatomic) ALChainsImpl *(^leftEqualToViewOffset)(ALCView *view, CGFloat offset);

/** Margin relative to superview */
@property (readonly, nonatomic) ALChainsImpl *(^top)(CGFloat topMargin);
@property (readonly, nonatomic) ALChainsImpl *(^right)(CGFloat rightMargin);
@property (readonly, nonatomic) ALChainsImpl *(^bottom)(CGFloat bottomMargin);
@property (readonly, nonatomic) ALChainsImpl *(^left)(CGFloat leftMargin);

@property (readonly, nonatomic) ALChainsImpl *(^adjacentAbove)(ALCView *view, CGFloat margin);
@property (readonly, nonatomic) ALChainsImpl *(^adjacentBelow)(ALCView *view, CGFloat margin);
@property (readonly, nonatomic) ALChainsImpl *(^adjacentRight)(ALCView *view, CGFloat margin);
@property (readonly, nonatomic) ALChainsImpl *(^adjacentLeft)(ALCView *view, CGFloat margin);

@property (readonly, nonatomic) ALChainsImpl *(^centerX)(CGFloat offset);
@property (readonly, nonatomic) ALChainsImpl *(^centerY)(CGFloat offset);

/** When applying constraints, replace existing constraints */
@property (readonly, nonatomic) ALChainsImpl *(^replace)();

@property (readonly, nonatomic) void (^apply)();

/** Remove all constraints affecting this view */
@property (readonly, nonatomic) void (^remove)();

@end


ALChainsImpl *ALChains(ALCView *view);
