pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract A {
  B private b;

  constructor (B _b) public {
    b = _b;
  }

  function bar () public {
    address [] memory keys;
    B.S [] memory values;

    (keys, values) = b.foo ();
  }
}

contract B {
  struct S {
    uint x;
    uint y;
  }

  mapping (address => S) private structs;
  address [] private keys;

  function foo () public view returns (address [] memory _keys, S [] memory _values) {
    _keys = keys;
    _values = new S [] (_keys.length);
    for (uint i = 0; i < _keys.length; i++)
      _values [i] = structs [_keys [i]];
  }
}
