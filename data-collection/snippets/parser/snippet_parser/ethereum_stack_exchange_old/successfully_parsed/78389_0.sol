pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract A {
  B private b;

  constructor (B _b) public {
    b = _b;
  }

  function bar () public {
    B.S [] memory structs = b.foo ();
  }
}

contract B {
  struct S {
    uint x;
    uint y;
  }

  S [] private structs;

  function foo () public view returns (S [] memory) {
    return structs;        
  }
}
