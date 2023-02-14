function requestMultiVariable(string memory URI) public {
    Chainlink.Request memory req = 
    req.add("get", URI);
    
}
