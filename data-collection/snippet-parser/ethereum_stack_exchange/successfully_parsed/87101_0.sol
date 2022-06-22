
function updatePools() public {
    uint256 length = pools.length;
    for (uint256 p = 0; p < length; ++p) {
        update(p);
    }
}
