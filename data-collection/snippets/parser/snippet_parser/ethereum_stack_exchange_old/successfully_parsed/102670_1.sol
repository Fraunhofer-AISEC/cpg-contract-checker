pragma solidity =0.5.16;

contract AddressComparison {
    function cmp(address token0, address token1) external pure returns (bool) {
        return token0 < token1;
    }
}
