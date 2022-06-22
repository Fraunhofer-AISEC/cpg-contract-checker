function check(uint8 n) public returns (bool) {
    for (uint256 i = 0; i < arr.length; i++) {
        if (arr[i] == n) {
            return true;
        }
    }
    return false;
}
