pragma solidity >=0.7.0 <0.9.0;

contract MyContract {

    function foo(uint i, uint j) external pure returns (uint) {
        uint8[16] memory x = [10, 2, 6, 42, 19, 5, 4, 36, 6, 6, 5, 5, 5, 46, 4, 4];
        return x[i] + x[j] * 12;
    }
}
