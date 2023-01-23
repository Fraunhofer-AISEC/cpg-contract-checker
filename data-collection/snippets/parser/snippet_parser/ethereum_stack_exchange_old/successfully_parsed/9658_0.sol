function MyToken(
    uint256 initialSupply,
    string tokenName,
    uint8 decimalUnits,
    string tokenSymbol,
    address contractOwner
) {
      balanceOf[msg.sender] = initialSupply; 
      totalSupply = initialSupply;          
      name = tokenName;                    
      symbol = tokenSymbol;               
      decimals = decimalUnits;           
      owner = contractOwner;
} 
