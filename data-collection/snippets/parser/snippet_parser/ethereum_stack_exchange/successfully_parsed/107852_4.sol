constructor(
    address owner,
    uint256 initSupply,
    string memory tokenName,
    string memory tokenSymbol,
    uint8 decimalUnits
) {
token = new Token(owner, initSupply, tokenName, tokenSymbol, decimalUnits); }
