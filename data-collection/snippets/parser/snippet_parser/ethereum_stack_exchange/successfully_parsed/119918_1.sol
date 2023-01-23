function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) {
    require(!paused, "The contract is paused!");

    
    address patronAccessToken = 0x000000001234567890ABCDEF0001112022222222;

    bool isPatron = (IToken(patronAccessToken).balanceOf(msg.sender) > 0);
    if (isPatron == true) {
        setCost(0.015 ether);
    }
    require(msg.value >= cost * _mintAmount, "Insufficient funds!");

    _mintLoop(msg.sender, _mintAmount);
}
