pragma solidity 0.8.4;

contract A {
    uint256 public constant X = 1;
}

contract B is A {
    uint256 override public constant X = 2;
}
