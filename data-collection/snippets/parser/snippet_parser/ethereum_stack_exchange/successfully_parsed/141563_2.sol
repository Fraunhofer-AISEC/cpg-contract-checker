function receiveTokens(address _from, uint256 _amount) public {
    ERC20 myToken = ERC20(_tokenIn);
    myToken.transferFrom(_from, address(this), _amount);
}
