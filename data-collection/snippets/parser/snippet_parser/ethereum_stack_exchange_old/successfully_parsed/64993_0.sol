mapping (uint => myStruct) myMapping;

function start(uint uuid) public returns (bool) {
    address tokenAddress = new Token();
    address crowdsaleAddress = new Crowdsale();
    Token(tokenAddress).addMinter(crowdsaleAddress);
    myMapping[uuid].addr_t = tokenAddress;
    myMapping[uuid].addr_c = crowdsaleAddress;
    return true;
}
