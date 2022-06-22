pragma solidity ^0.5.8;

import "./SafeMath.sol";

contract Test {

using SafeMath for uint256;

uint256 c = 10;

    function addition() public {
        uint256 a = 10;
        uint256 b = 10;
        c = a.add(b);
    }

    function getValue() view public returns (uint256) {
        return c;
    }

}
