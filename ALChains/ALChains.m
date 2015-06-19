//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import "ALChains.h"
#import "ALCBuilder.h"


@implementation ALChainsImpl {
  ALCView *_view;

  BOOL _replaceOnApply;

  CGFloat _leftMargin, _rightMargin, _topMargin, _bottomMargin;
  BOOL _topMarginSet, _rightMarginSet, _bottomMarginSet, _leftMarginSet;

  ALCView *_adjacentBelowView, *_adjacentRightView, *_adjacentLeftView, *_adjacentAboveView;
  CGFloat _adjacentBelowMargin, _adjacentRightMargin, _adjacentLeftMargin, _adjacentAboveMargin;

  ALCBuilder *_builder;

  NSMutableSet *_otherViews;
}

- (instancetype)initWithView:(ALCView *)view {
  NSParameterAssert(view);
  NSAssert(view.superview != nil, @"View must be part of a view hierarchy (i.e. it must have a superview) in order to "
      "setup auto-layout constraints. Make sure the target view is a subview of another view before calling this.");
  self = [super init];
  if (self) {
    _view = view;
    _otherViews = [[NSMutableSet alloc] init];
    _builder = [[ALCBuilder alloc] initWithView:view];

    __weak ALChainsImpl *weakSelf = self;
    __weak ALCBuilder *weakBuilder = _builder;
    _fill = ^{ [weakSelf fill_impl]; return weakSelf; };
    _widthEqualTo = ^(CGFloat width) { [weakSelf widthEqualTo_impl:width]; return weakSelf; };
    _heightEqualTo = ^(CGFloat height) { [weakSelf heightEqualTo_impl:height]; return weakSelf; };
    _widthEqualToView = ^(ALCView *v) { [weakSelf widthEqualToView_impl:v offset:0]; return weakSelf; };
    _widthEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf widthEqualToView_impl:v offset:offset]; return weakSelf; };
    _heightEqualToView = ^(ALCView *v) { [weakSelf heightEqualToView_impl:v offset:0]; return weakSelf; };
    _heightEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf heightEqualToView_impl:v offset:offset]; return weakSelf; };
    _widthConstrainedByAspectRatio = ^(CGFloat r) { [weakBuilder widthConstrainedByAspectRatio:r]; return weakSelf; };
    _heightConstrainedByAspectRatio = ^(CGFloat r) { [weakBuilder heightConstrainedByAspectRatio:r]; return weakSelf; };
    _topEqualToView = ^(ALCView *v) { [weakSelf topEqualToView_impl:v offset:0]; return weakSelf; };
    _topEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf topEqualToView_impl:v offset:offset]; return weakSelf; };
    _rightEqualToView = ^(ALCView *v) { [weakSelf rightEqualToView_impl:v offset:0]; return weakSelf; };
    _rightEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf rightEqualToView_impl:v offset:offset]; return weakSelf; };
    _bottomEqualToView = ^(ALCView *v) { [weakSelf bottomEqualToView_impl:v offset:0]; return weakSelf; };
    _bottomEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf bottomEqualToView_impl:v offset:offset]; return weakSelf; };
    _leftEqualToView = ^(ALCView *v) { [weakSelf leftEqualToView_impl:v offset:0]; return weakSelf; };
    _leftEqualToViewOffset = ^(ALCView *v, CGFloat offset) { [weakSelf leftEqualToView_impl:v offset:offset]; return weakSelf; };
    _top = ^(CGFloat margin) { [weakSelf top_impl:margin]; return weakSelf; };
    _right = ^(CGFloat margin) { [weakSelf right_impl:margin]; return weakSelf; };
    _bottom = ^(CGFloat margin) { [weakSelf bottom_impl:margin]; return weakSelf; };
    _left = ^(CGFloat margin) { [weakSelf left_impl:margin]; return weakSelf; };
    _adjacentAbove = ^(id v, CGFloat margin) { [weakSelf adjacentAbove_impl:v margin:margin]; return weakSelf; };
    _adjacentBelow = ^(id v, CGFloat margin) { [weakSelf adjacentBelow_impl:v margin:margin]; return weakSelf; };
    _adjacentRight = ^(id v, CGFloat margin) { [weakSelf adjacentRight_impl:v margin:margin]; return weakSelf; };
    _adjacentLeft = ^(id v, CGFloat margin) { [weakSelf adjacentLeft_impl:v margin:margin]; return weakSelf; };
    _centerX = ^(CGFloat offset) { [weakSelf centerX_impl:offset]; return weakSelf; };
    _centerY = ^(CGFloat offset) { [weakSelf centerY_impl:offset]; return weakSelf; };
    _replace = ^{ [weakSelf replace_impl]; return weakSelf; };
    _apply = ^{ [weakSelf apply_impl]; };
    _remove = ^{ [weakSelf remove_impl]; };
  }
  return self;
}

- (instancetype)init {
  return [self initWithView:nil];
}

#pragma mark Action impl
- (void)fill_impl {
  self.top(0).right(0).bottom(0).left(0);
}

- (void)widthEqualTo_impl:(CGFloat)width {
  [_builder widthEqualTo:width];
}

- (void)heightEqualTo_impl:(CGFloat)height {
  [_builder heightEqualTo:height];
}

- (void)widthEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder widthEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)heightEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder heightEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)topEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder topEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)rightEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder rightEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)bottomEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder bottomEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)leftEqualToView_impl:(id)view offset:(CGFloat)offset {
  [_builder leftEqualToView:view offset:offset];
  [_otherViews addObject:view];
}

- (void)top_impl:(CGFloat)margin {
  [_builder topEqualTo:margin];
//  _topMargin = margin;
//  _topMarginSet = YES;
}

- (void)right_impl:(CGFloat)margin {
  [_builder rightEqualTo:margin];
//  _rightMargin = margin;
//  _rightMarginSet = YES;
}

- (void)bottom_impl:(CGFloat)margin {
  [_builder bottomEqualTo:margin];
//  _bottomMargin = margin;
//  _bottomMarginSet = YES;
}

- (void)left_impl:(CGFloat)margin {
  [_builder leftEqualTo:margin];
//  _leftMargin = margin;
//  _leftMarginSet = YES;
}

- (void)adjacentAbove_impl:(ALCView *)view margin:(CGFloat)margin {
//  [self bottom_impl:-margin];
  _adjacentAboveView = view;
  _adjacentAboveMargin = margin;
  [_otherViews addObject:view];
}

- (void)adjacentBelow_impl:(ALCView *)view margin:(CGFloat)margin {
//  [self top_impl:margin];
  _adjacentBelowView = view;
  _adjacentBelowMargin = margin;
  [_otherViews addObject:view];
}

- (void)adjacentRight_impl:(ALCView *)view margin:(CGFloat)margin {
//  [self left_impl:margin];
  _adjacentRightView = view;
  _adjacentRightMargin = margin;
  [_otherViews addObject:view];
}

- (void)adjacentLeft_impl:(ALCView *)view margin:(CGFloat)margin {
//  [self right_impl:-margin];
  _adjacentLeftView = view;
  _adjacentLeftMargin = margin;
  [_otherViews addObject:view];
}

- (void)centerX_impl:(CGFloat)offset {
  [_builder centerXWithOffset:offset];
}

- (void)centerY_impl:(CGFloat)offset {
  [_builder centerYWithOffset:offset];
}

- (void)replace_impl {
  _replaceOnApply = YES;
}

- (void)apply_impl {
  [_view setTranslatesAutoresizingMaskIntoConstraints:NO];

  id ancestor = [self ancestor];

  NSMutableArray *constraints = [[NSMutableArray alloc] init];
  if (_adjacentBelowView) {
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual toItem:_adjacentBelowView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0 constant:_adjacentBelowMargin]];
  }
  if (_adjacentLeftView) {
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual toItem:_adjacentLeftView
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0 constant:-_adjacentLeftMargin]];
  }
  if (_adjacentAboveView) {
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual toItem:_adjacentAboveView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0 constant:-_adjacentAboveMargin]];
  }
  if (_adjacentRightView) {
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual toItem:_adjacentRightView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:_adjacentRightMargin]];
  }
  [constraints addObjectsFromArray:[_builder constraints]];

  if (_replaceOnApply) {
    [self removeConstraintsFromView:ancestor targetingView:_view];
  }
  [ancestor addConstraints:constraints];
}

- (void)remove_impl {
  id ancestor = [self ancestor];
  [self removeConstraintsFromView:ancestor targetingView:_view];
}

#pragma mark Helpers
- (NSLayoutConstraint *)edgeConstraintForAttribute:(NSLayoutAttribute)attribute margin:(CGFloat)offset {
  switch (attribute) {
    case NSLayoutAttributeRight:
    case NSLayoutAttributeBottom:
      offset = -offset;
      break;

    default:
      // Keep offset the same
      break;
  }

  return [NSLayoutConstraint constraintWithItem:_view
                                      attribute:attribute
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_view.superview
                                      attribute:attribute
                                     multiplier:1.0
                                       constant:offset];
}

- (NSLayoutConstraint *)dimensionConstraintForAttribute:(NSLayoutAttribute)attribute equalToView:(ALCView *)equalView {
  return [NSLayoutConstraint constraintWithItem:_view
                               attribute:attribute
                               relatedBy:NSLayoutRelationEqual
                                  toItem:equalView
                               attribute:attribute
                              multiplier:1.0
                                constant:0];
}

- (NSLayoutConstraint *)dimensionConstraintForAttribute:(NSLayoutAttribute)attribute equalTo:(CGFloat)value {
  return [NSLayoutConstraint constraintWithItem:_view
                                      attribute:attribute
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0
                                       constant:value];
}

static void findRoot(ALCView *view, NSMutableOrderedSet *ancestors) {
  if (!view) {
    return;
  }
  findRoot(view.superview, ancestors);
  [ancestors addObject:view];
}

- (ALCView *)ancestor {
  NSMutableOrderedSet *merged = [[NSMutableOrderedSet alloc] init];
  BOOL mergedInit = NO;

  NSArray *views = [_otherViews.allObjects arrayByAddingObject:_view.superview];
  for (id v in views) {
    NSMutableOrderedSet *ancestors = [[NSMutableOrderedSet alloc] init];
    findRoot(v, ancestors);

    if (!mergedInit) {
      [merged unionOrderedSet:ancestors];
      mergedInit = YES;
    } else {
      [merged intersectOrderedSet:ancestors];
    }
  }
  NSAssert(merged.count > 0, @"Shouldn't be zero");
  NSAssert(merged.lastObject, @"Couldn't find ancestor view");
  return merged.lastObject;
}

- (void)removeConstraintsFromView:(ALCView *)hostView targetingView:(ALCView *)target {
  NSMutableArray *toRemove = [[NSMutableArray alloc] init];
  for (NSLayoutConstraint *constraint in hostView.constraints) {
    if (constraint.firstItem == target) {
      [toRemove addObject:constraint];
    }
  }

  if (toRemove.count > 0) {
    [hostView removeConstraints:toRemove];
  }
}

@end


ALChainsImpl *ALChains(ALCView *view) {
  return [[ALChainsImpl alloc] initWithView:view];
}
