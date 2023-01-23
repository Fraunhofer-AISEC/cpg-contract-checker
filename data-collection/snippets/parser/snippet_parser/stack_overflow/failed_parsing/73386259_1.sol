function buyTokens() public payable returns (uint256 tokenAmount) {
require(msg.value > 0, "Send ETH to buy some tokens");

uint256 amountToBuy = msg.value * tokensPerEth;


uint256 contractBalance = ercToken.balanceOf(address(this));
require(contractBalance >= amountToBuy, "Vendor contract has not enough tokens in its 
balance");


(bool sent) = ercToken.transfer(msg.sender, amountToBuy);
require(sent, "Failed to transfer token to user");


 emit BuyTokens(msg.sender, msg.value, amountToBuy);

return amountToBuy;
}
