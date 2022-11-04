contract A {
  uint state = 0;

  function foo (uint x) public returns (uint) {
    return state += x;
  }
}

contract B {
  A a;

  constructor (A _a) public {
    a = _a;
  }

  function bar (uint y) public {
    emit Zoo (a.foo (y));
  }

  event Zoo (uint z);
}
