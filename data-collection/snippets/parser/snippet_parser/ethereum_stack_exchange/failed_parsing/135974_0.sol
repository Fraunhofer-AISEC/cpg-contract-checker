function initialFunction() public returns (string memory) {
    bytes memeory result = "{}"; 
    uint256 lastRun; 
    
    bytes32 request = buildRequest(address(this), this.f2.selector);
    
    lastRun = block.timestamp;
    
    while ((block.timestamp - lastRun) < 30 seconds && string(result) == "{}") {
        if (string(result) != "{}") {
            return result;
        }
        lastRun = block.timestamp;
    }   
}

function callbackFunction(string memory _result, string _newValue) public returns (string memory) {
    _result = _newValue;
}
