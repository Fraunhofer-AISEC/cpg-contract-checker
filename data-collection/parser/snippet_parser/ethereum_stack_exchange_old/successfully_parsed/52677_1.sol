constructor (uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) public {
    balances[msg.sender] = _initialAmount; 
    totalSupply = _initialAmount; 
    name = _tokenName; 
    decimals = _decimalUnits; 
    symbol = _tokenSymbol; 
}
