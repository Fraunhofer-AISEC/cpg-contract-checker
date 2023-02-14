contract ArrayTest {
  uint[2] a;

  event ReverseLoop(uint n);
  event NormalLoop(uint n);

  constructor() public {
    a[0] = 1;
    a[1] = 2;
  }

  function reverseLoop() external {
    for (uint i = a.length-1; i >= 0; i--) {
        emit ReverseLoop(a[i]);
    }
  }

  function normalLoop() external {
    for (uint i = 0; i < a.length; i++) {
        emit NormalLoop(a[i]);
    }
  }
}
