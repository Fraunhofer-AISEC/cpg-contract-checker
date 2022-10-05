pragma solidity ^0.4.18;

contract Test {
  enum EnumTest {
    Test0,
    Test1
  }

  struct StructTest {
    EnumTest Foo;
    uint256 Bar;
  }
}
