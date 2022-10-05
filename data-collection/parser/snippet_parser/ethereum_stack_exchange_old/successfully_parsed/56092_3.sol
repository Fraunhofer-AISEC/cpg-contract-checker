function tokensToBeReturned(ERC20Basic token) public view returns (uint) {
    return token.balanceOf(this);
}
