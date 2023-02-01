pragma solidity ^0.4.20;

contract Test {
    uint256 a;
    uint256 b;
    uint256 c;
    uint256 d;
    uint256 e;
    mapping (string => bool) exists;

    function Test() public {
        exists["my_key"] = true;
    }
}
