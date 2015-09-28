# postcss-presass-at
Optional at sign

Input:
```
mixin padding($sides, $unit) {
  // ...
  content;
}

.block {
  function task($arg) {
    if $arg == true {
      return: $arg;
    }
    else {
      return: $arg;
    }
  }

  media (min-width: 100px) {
    include: padding(10, em);
    extend: %this-placeholder;

    // With semicolon
    include: block(10, em) {
      background: blue;
    }

    // Without semicolon
    include block(10, em) {
      background: blue;
    }
  }
}
```

Output:
```scss
@mixin padding($sides, $unit) {
  // ...
  @content;
}

.block {
  @function task($arg) {
    @if $arg == true {
      @return $arg;
    }
    @else {
      @return $arg;
    }
  }

  @media (min-width: 100px) {
    @include padding(10, em);
    @extend %this-placeholder;

    // With semicolon
    @include block(10, em) {
      background: blue;
    }

    // Without semicolon
    @include block(10, em) {
      background: blue;
    }
  }
}
```
