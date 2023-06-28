function MyAdvancedToken(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
) TokenERC20(initialSupply, tokenName, tokenSymbol) public {
    isEnabled = true;
}
