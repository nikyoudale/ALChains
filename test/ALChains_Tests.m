//
//  ALChains
//
//  Created by Nik Youdale on 10/02/2014.
//  Copyright (c) 2014 Nik Youdale. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ALChains/ALCBuilder.h>

@interface ALChains_Tests : XCTestCase

@end

@implementation ALChains_Tests {
  NSView *_testView;
  NSView *_view2;
}

- (void)setUp {
  [super setUp];
  _testView = [[NSView alloc] init];
  _view2 = [[NSView alloc] init];
}

- (void)testWidthEqualToView {
  ALCBuilder *builder = [[ALCBuilder alloc] initWithView:_testView];
  [builder widthEqualToView:_view2 offset:0];

  NSArray *constraints = [builder constraints];
  NSArray *expected = @[
    [NSLayoutConstraint constraintWithItem:_testView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_view2
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1
                                  constant:0]
  ];

  [self assertConstraints:expected actual:constraints];
}

- (void)testWidthEqualTo {
  ALCBuilder *builder = [[ALCBuilder alloc] initWithView:_testView];
  [builder widthEqualTo:200];

  NSArray *constraints = [builder constraints];
  NSArray *expected = @[
                        [NSLayoutConstraint constraintWithItem:_testView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:0
                                                        toItem:nil
                                                     attribute:0
                                                    multiplier:1
                                                      constant:200]
                        ];
  
  [self assertConstraints:expected actual:constraints];
}

- (void)testHeightEqualToView {
  ALCBuilder *builder = [[ALCBuilder alloc] initWithView:_testView];
  [builder heightEqualToView:_view2 offset:0];

  NSArray *constraints = [builder constraints];
  NSArray *expected = @[
                        [NSLayoutConstraint constraintWithItem:_testView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_view2
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]
                        ];
  
  [self assertConstraints:expected actual:constraints];
}

- (void)testHeightEqualTo {
  ALCBuilder *builder = [[ALCBuilder alloc] initWithView:_testView];
  [builder heightEqualTo:200];

  NSArray *constraints = [builder constraints];
  NSArray *expected = @[
                        [NSLayoutConstraint constraintWithItem:_testView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:0
                                                        toItem:nil
                                                     attribute:0
                                                    multiplier:1
                                                      constant:200]
                        ];

  [self assertConstraints:expected actual:constraints];
}

- (void)testLeftEqualToView {
  ALCBuilder *builder = [[ALCBuilder alloc] initWithView:_testView];
  [builder leftEqualToView:_view2 offset:0];

  NSArray *constraints = [builder constraints];
  NSArray *expected = @[
                        [NSLayoutConstraint constraintWithItem:_testView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_view2
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]
                        ];

  [self assertConstraints:expected actual:constraints];
}

#pragma mark Helpers
- (void)assertConstraints:(NSArray *)expected actual:(NSArray *)actual {
  XCTAssertEqual(expected.count, actual.count);

  for (NSInteger i = 0; i < expected.count; i++) {
    NSLayoutConstraint *expectedConstraint = [expected objectAtIndex:i];
    NSLayoutConstraint *actualConstraint = [actual objectAtIndex:i];

    XCTAssertEqual(expectedConstraint.priority, actualConstraint.priority);
    XCTAssertEqual(expectedConstraint.firstItem, actualConstraint.firstItem);
    XCTAssertEqual(expectedConstraint.firstAttribute, actualConstraint.firstAttribute);
    XCTAssertEqual(expectedConstraint.relation, actualConstraint.relation);
    XCTAssertEqual(expectedConstraint.secondItem, actualConstraint.secondItem);
    XCTAssertEqual(expectedConstraint.secondAttribute, actualConstraint.secondAttribute);
    XCTAssertEqual(expectedConstraint.multiplier, actualConstraint.multiplier);
    XCTAssertEqual(expectedConstraint.constant, actualConstraint.constant);
  }
}

@end
