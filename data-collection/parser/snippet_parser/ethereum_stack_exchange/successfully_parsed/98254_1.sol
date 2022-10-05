function sellToken(address _tokenAddress, uint tokenAmount) public returns (bool success) {
    ERC20 token = ERC20(_tokenAddress);
    require(token.balanceOf(msg.sender) >= tokenAmount);
    uint allowance = token.allowance(msg.sender, contractAddr);
    require(allowance >= tokenAmount);
    token.transferFrom(msg.sender, contractAddr, tokenAmount);
    return true;
}
