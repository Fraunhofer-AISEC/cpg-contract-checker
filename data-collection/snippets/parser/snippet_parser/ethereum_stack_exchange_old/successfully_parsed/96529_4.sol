  function foo(int256 x) external pure returns (int) {
    int a =  x > 0 ? 1 : 0;
    int b = x < 0 ? 1 : 0;
    return a - b;
  }
