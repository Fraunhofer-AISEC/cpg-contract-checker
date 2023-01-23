constructor (
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
) public {
    totalSupply = initialSupply * 10 ** uint256(decimals);  
    balanceOf[msg.sender] = totalSupply;                
    name = tokenName;                                   
    symbol = tokenSymbol;                               
}
