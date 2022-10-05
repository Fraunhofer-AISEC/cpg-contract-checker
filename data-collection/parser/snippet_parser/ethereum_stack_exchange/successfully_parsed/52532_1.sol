
function TitanToken(uint256 _initialSupply, bytes32 _tokenName, bytes32 _tokenSymbol) public {
    totalSupply = _initialSupply * 10 ** uint256(decimals);  
    name = _tokenName;                                   
    symbol = _tokenSymbol;                               
}    
