function checkMax(string calldata _test) public view returns (string memory) {
    string memory testing = _test; 
    string memory newTesting = testing;
    newTesting = "changed bro!";
    assert(maxAmount == 100);
    return testing; 
}
