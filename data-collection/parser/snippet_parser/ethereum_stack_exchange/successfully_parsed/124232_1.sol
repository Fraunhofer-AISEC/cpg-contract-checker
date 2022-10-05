function set(uint256 x) public {
    storedData = x;
}

function get() public view returns (uint256) {
    return storedData;
}

function increment() public {
    ctr = ctr + 1;
}

function display() public view returns (uint256) {
    return ctr;
}
