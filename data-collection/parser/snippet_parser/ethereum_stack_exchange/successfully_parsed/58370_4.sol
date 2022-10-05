uint256 size = 10;

function initArray() public pure {
    uint256[][] memory arr = new uint256[][](size);
    for (uint i; i < size; i++) {
        arr[i] = new uint256[](size);
    }
    
}
