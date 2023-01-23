function getERC20Balance(address _address) view public returns (uint) {
    return ERC20Interface(tokenAddress).balanceOf(_address);
}
