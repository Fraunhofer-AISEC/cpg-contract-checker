pragma solidity ^0.4.19;

contract Test {
    uint256[100] big;
    uint128[100] small;

    function addBig(uint8 index, uint256 num) public {
        big[index] = num;
    }

    function addSmall(uint8 index, uint128 num1, uint128 num2) public {
        small[index] = num1;
        small[index + 1] = num2;
    }
}
