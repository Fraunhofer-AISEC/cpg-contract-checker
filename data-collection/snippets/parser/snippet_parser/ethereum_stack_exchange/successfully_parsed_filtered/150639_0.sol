pragma solidity >=0.8.19 <0.9.0;

contract Foo {
    uint256 public constant SIZE = 10;

    function func(uint256 x) external pure returns (uint256) {
        uint256 y = SIZE * 3;
        return x + y;
    }
}
