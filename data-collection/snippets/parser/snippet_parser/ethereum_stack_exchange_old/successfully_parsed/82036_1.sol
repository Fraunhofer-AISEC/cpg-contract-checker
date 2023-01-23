function TokenERC20(uint256 initialSupply, string tokenName, string tokenSymbol) public {
    totalSupply = 250000000 * 10 ** uint256(decimals); 
    balanceOf[msg.sender] = totalSupply;     
    name = "PONTEM";                         
    symbol = "PXM";                          
}
