function buyTokens() public payable {
require(publicBuyActivated == true);
address payable transaction_sender = msg.sender;
uint256 weiAmount = msg.value;
_preValidatePurchase(transaction_sender, weiAmount);


uint256 tokens = msg.value / _rate;

_processPurchase(transaction_sender, tokens);
emit TokensPurchased(transaction_sender, address(this), weiAmount, tokens);

if (firstBuyTime[transaction_sender] == 0) {
    firstBuyTime[transaction_sender] = block.timestamp;
}



__wallet.transfer(msg.value);
}