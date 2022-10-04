pragma solidity ^0.8.0;

function foo() external pure returns (uint256, uint256, uint256) {
    uint256 i1 = uint256(2) << 255;
    uint256 i2 = uint256(4) << 255;
    uint256 i3 = uint256(8) << 255;
    return (i1, i2, i3);
}
