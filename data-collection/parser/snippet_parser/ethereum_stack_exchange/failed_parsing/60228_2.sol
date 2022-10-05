function buyTokens(address _receiver) public payable { 
uint256 _amount = msg.value; 
require(_receiver != address(0)); require(_amount > 0); 
uint256 tokensToBuy = multiply(_amount, (10 * decimals)) / 1 ether tokenPrice;
require(tokenContract.transfer(_receiver, tokensToBuy)); 
tokensSold += _amount; 

emit Sell(msg.sender, tokensToBuy); }
