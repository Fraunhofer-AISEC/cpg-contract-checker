

pragma solidity 0.6.2;

library Lib {
    bytes1 constant flag = 0x01;
}

contract A {
    bytes1 public x = Lib.flag;
}
