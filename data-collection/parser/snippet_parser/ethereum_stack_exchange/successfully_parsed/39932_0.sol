pragma solidity 0.4.20;

contract Test {

  struct Example {
  bool v1;
  bool v2;
  bool v3;
  bool v4;
  bool v5;
  bool v6;
  bool v7;
  bool v8;
  }

  Example example;

  function test() public {
    Example memory ex = Example({
    v1: true,
    v2: true,
    v3: true,
    v4: true,
    v5: true,
    v6: true,
    v7: true,
    v8: true
    });

    example = ex;
  }
}
