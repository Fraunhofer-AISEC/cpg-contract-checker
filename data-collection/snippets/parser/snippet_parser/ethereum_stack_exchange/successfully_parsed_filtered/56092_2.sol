function tokensToBeReturned(ERC20Basic token) public returns (uint) {
    return token.balanceOf(this);
}
