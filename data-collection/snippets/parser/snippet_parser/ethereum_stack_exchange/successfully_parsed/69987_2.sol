pragma solidity 0.5.7;

contract Uncombine {
    function getVariables(uint256 combined) external pure returns (uint64 variable1, uint64 variable2, uint64 variable3, uint64 variable4) {
        variable1 = uint64(combined);
        variable2 = uint64(combined >> 64);
        variable3 = uint64(combined >> 128);
        variable4 = uint64(combined >> 192);
    }
}
