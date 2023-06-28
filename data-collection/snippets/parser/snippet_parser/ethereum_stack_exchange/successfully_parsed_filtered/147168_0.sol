function a(int256 x) pure returns (uint256 result) {
    assembly {
        result := div(sub(0, x), x) 
    }
}

function b(int256 x) pure returns (uint256 result) {
    result = -x / x;
}
