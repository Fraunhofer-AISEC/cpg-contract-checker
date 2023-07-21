constructor(string memory name, string memory symbol, uint8 decimals,address totalSupply, address marketingWallet, 
address devWallet, address payable feeReceiver, address tokenOwnerAddress) public payable {
_name = "Mytoken";
_symbol = "MYT";
_decimals = 18;
totalSupply = 15 * 10**9 * 10**18; 
devTokens = (totalSupply * 5) / 100; 
marketingTokens = (totalSupply * 5) / 100; 
  
_mint(tokenOwnerAddress, totalSupply);
  
feeReceiver.transfer(msg.value);
}
