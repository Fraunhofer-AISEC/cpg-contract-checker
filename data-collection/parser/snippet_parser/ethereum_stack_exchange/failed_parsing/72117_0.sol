function transfer(address to, uint value) public returns (bool success) {
    ...
    if (to == desiredAddress) {
        ABC(abcAddress).mint(to, value);
    }
    ...
}
