function isDefault(string memory _str) public pure returns (bool) {
    if(bytes(_str).length == 0) return true;
    return false;
}
