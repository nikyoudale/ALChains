//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import "ALCBuilder.h"

#define CGFloatFromNSNumber(number) ((CGFloat)number.doubleValue)

@implementation ALCBuilder {
  ALCView *_view;

  ALCView *_widthView;
  NSNumber *_widthValue, *_widthOffset;
  ALCView *_heightView;
  NSNumber *_heightValue, *_heightOffset;

  ALCView *_topView;
  NSNumber *_topValue, *_topOffset;
  ALCView *_rightView;
  NSNumber *_rightValue, *_rightOffset;
  ALCView *_bottomView;
  NSNumber *_bottomValue, *_bottomOffset;
  ALCView *_leftView;
  NSNumber *_leftValue, *_leftOffset;

  NSNumber *_centerXOffset;
  NSNumber *_centerYOffset;

  NSNumber *_heightAspectRatio;
  NSNumber *_widthAspectRatio;
}

- (instancetype)initWithView:(ALCView *)view {
  self = [super init];
  if (self) {
    _view = view;
  }
  return self;
}

- (id)init {
  return [self initWithView:nil];
}

#pragma mark Width and height
- (ALCBuilder *)widthEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _widthView = view;
  _widthOffset = @(offset);
  return self;
}

- (ALCBuilder *)widthEqualTo:(CGFloat)width {
  _widthValue = @(width);
  return self;
}

- (ALCBuilder *)heightEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _heightView = view;
  _heightOffset = @(offset);
  return self;
}

- (ALCBuilder *)heightEqualTo:(CGFloat)height {
  _heightValue = @(height);
  return self;
}

- (ALCBuilder *)heightConstrainedByAspectRatio:(CGFloat)aspectRatio {
  _heightAspectRatio = @(1.0/aspectRatio);
  return self;
}

- (ALCBuilder *)widthConstrainedByAspectRatio:(CGFloat)aspectRatio {
  _widthAspectRatio = @(aspectRatio);
  return self;
}

#pragma mark Top, right, bottom, left
- (ALCBuilder *)topEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _topView = view;
  _topOffset = @(offset);
  return self;
}

- (ALCBuilder *)topEqualTo:(CGFloat)value {
  _topValue = @(value);
  return self;
}

- (ALCBuilder *)rightEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _rightView = view;
  _rightOffset = @(offset);
  return self;
}

- (ALCBuilder *)rightEqualTo:(CGFloat)value {
  _rightValue = @(value);
  return self;
}

- (ALCBuilder *)bottomEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _bottomView = view;
  _bottomOffset = @(offset);
  return self;
}

- (ALCBuilder *)bottomEqualTo:(CGFloat)value {
  _bottomValue = @(value);
  return self;
}

- (ALCBuilder *)leftEqualToView:(ALCView *)view offset:(CGFloat)offset {
  NSParameterAssert(view);
  _leftView = view;
  _leftOffset = @(offset);
  return self;
}

- (ALCBuilder *)leftEqualTo:(CGFloat)value {
  _leftValue = @(value);
  return self;
}

#pragma mark Centering
- (ALCBuilder *)centerXWithOffset:(CGFloat)offset {
  _centerXOffset = @(offset);
  return self;
}

- (ALCBuilder *)centerYWithOffset:(CGFloat)offset {
  _centerYOffset = @(offset);
  return self;
}

#pragma mark Constraint building
- (NSArray *)constraints {
  NSMutableArray *constraints = [NSMutableArray array];

  if (_widthView) {
    NSAssert(!_widthValue, @"Cannot set width and width view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeWidth equalToView:_widthView offset:_widthOffset]];
  } else if (_widthValue) {
    NSAssert(!_widthView, @"Cannot set width and width view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeWidth
                                                         equalTo:(CGFloat)_widthValue.doubleValue]];
  }

  if (_heightView) {
    NSAssert(!_heightValue, @"Cannot set height and height view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeHeight equalToView:_heightView offset:_heightOffset]];
  } else if (_heightValue) {
    NSAssert(!_heightView, @"Cannot set height and height view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeHeight
                                                         equalTo:(CGFloat)_heightValue.doubleValue]];
  }

  if (_topView) {
    NSAssert(!_topValue, @"Cannot set top and top view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeTop
                                                     equalToView:_topView
                                                          offset:_topOffset]];
  } else if (_topValue) {
    NSAssert(!_topView, @"Cannot set top and top view");
    [constraints addObject:[self edgeConstraintForAttribute:NSLayoutAttributeTop
                                                     margin:(CGFloat)_topValue.doubleValue]];
  }

  if (_rightView) {
    NSAssert(!_rightValue, @"Cannot set right and right view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeRight
                                                     equalToView:_rightView
                                                          offset:_rightOffset]];
  } else if (_rightValue) {
    NSAssert(!_rightView, @"Cannot set right and right view");
    [constraints addObject:[self edgeConstraintForAttribute:NSLayoutAttributeRight
                                                     margin:(CGFloat)_rightValue.doubleValue]];
  }

  if (_bottomView) {
    NSAssert(!_bottomValue, @"Cannot set bottom and bottom view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeBottom
                                                     equalToView:_bottomView
                                                          offset:_bottomOffset]];
  } else if (_bottomValue) {
    NSAssert(!_bottomView, @"Cannot set bottom and bottom view");
    [constraints addObject:[self edgeConstraintForAttribute:NSLayoutAttributeBottom
                                                     margin:(CGFloat)_bottomValue.doubleValue]];
  }

  if (_leftView) {
    NSAssert(!_leftValue, @"Cannot set left and left view");
    [constraints addObject:[self dimensionConstraintForAttribute:NSLayoutAttributeLeft
                                                     equalToView:_leftView
                                                          offset:_leftOffset]];
  } else if (_leftValue) {
    NSAssert(!_leftView, @"Cannot set left and left view");
    [constraints addObject:[self edgeConstraintForAttribute:NSLayoutAttributeLeft
                                                     margin:(CGFloat)_leftValue.doubleValue]];
  }

  if (_centerXOffset) {
    [constraints addObject:[self centerConstraintForAttribute:NSLayoutAttributeCenterX offset:_centerXOffset]];
  }
  if (_centerYOffset) {
    [constraints addObject:[self centerConstraintForAttribute:NSLayoutAttributeCenterY offset:_centerYOffset]];
  }

  if (_widthAspectRatio) {
    NSAssert(!_heightAspectRatio, @"Cannot set both width and height aspect ratio");
    [constraints addObject:[self constraintForAttribute:NSLayoutAttributeWidth constrainedByAspectRatio:_widthAspectRatio toAttribute:NSLayoutAttributeHeight]];
  }
  if (_heightAspectRatio) {
    NSAssert(!_widthAspectRatio, @"Cannot set both width and height aspect ratio");
    [constraints addObject:[self constraintForAttribute:NSLayoutAttributeHeight constrainedByAspectRatio:_heightAspectRatio toAttribute:NSLayoutAttributeWidth]];
  }

  return constraints;
}

- (NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute
                      constrainedByAspectRatio:(NSNumber *)aspectRatio
                                   toAttribute:(NSLayoutAttribute)toAttribute {
  NSParameterAssert(attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight);
  NSParameterAssert(toAttribute == NSLayoutAttributeWidth || toAttribute == NSLayoutAttributeHeight);
  NSParameterAssert(attribute != toAttribute);
  NSParameterAssert(aspectRatio);
  return [NSLayoutConstraint constraintWithItem:_view
                                      attribute:attribute
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_view
                                      attribute:toAttribute
                                     multiplier:CGFloatFromNSNumber(aspectRatio)
                                       constant:0];
}

- (NSLayoutConstraint *)centerConstraintForAttribute:(NSLayoutAttribute)attribute offset:(NSNumber *)offset {
  NSParameterAssert(offset);
  return [NSLayoutConstraint constraintWithItem:_view
                                      attribute:attribute
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_view.superview
                                      attribute:attribute
                                     multiplier:1.0
                                       constant:CGFloatFromNSNumber(offset)];
}

- (NSLayoutConstraint *)dimensionConstraintForAttribute:(NSLayoutAttribute)attribute
                                            equalToView:(ALCView *)equalView
                                                 offset:(NSNumber *)offset {
  return [NSLayoutConstraint constraintWithItem:_view
                                      attribute:attribute
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:equalView
                                      attribute:attribute
                                     multiplier:1.0
                                       constant:CGFloatFromNSNumber(offset)];
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


@end
