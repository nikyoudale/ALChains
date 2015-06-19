# ALChains
Auto Layout chains - chain based auto-layout constraint builder

## Why?

This is ugly:
```
NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:otherView
                                      attribute:NSLayoutAttributeWidth
                                     multiplier:1.0
                                       constant:0];
[view addConstraint:constraint];
```

Writing the same thing with ALChains:
```
ALChains(view)
  .widthEqualToView(otherView)
  .apply();
```

## Examples

### View with fixed dimensions (300 x 180)
```
ALChains(view)
  .widthEqualTo(300)
  .heightEqualTo(180)
  .apply();
```

### View completely fills another view
```
ALChains(view)
  .fill()
  .apply();
```

### View with fixed dimensions centered in superview, but offset in Y direction by 20
```
ALChains(view)
  .widthEqualTo(300)
  .heightEqualTo(180)
  .centerX(0)
  .centerY(20)
  .apply();
```

### View with same height as another view, positioned to its right with a margin of 10
```
ALChains(view)
  .widthEqualTo(100)
  .heightEqualToView(otherView)
  .adjacentRight(otherView, 10)
  .apply();
```

Pretty simple, might not cover all use cases, but i've found it pretty useful in my own projects.
