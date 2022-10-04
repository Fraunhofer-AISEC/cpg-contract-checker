IERC20 public dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
function buy(uint etherAmount)
    external
    icoActive() {
    require(
      etherAmount >= minPurchase && etherAmount <= maxPurchase, 
      'have to buy between minPurchase and maxPurchase'
    );
    uint tokenAmount = etherAmount.div(price);
    
    require(
      tokenAmount <= availableTokens, 
      'Not enough tokens left for sale'
    );
    dai.transferFrom(msg.sender, address(this), etherAmount);
    token.mint(address(this), tokenAmount);
    sales[msg.sender] = Sale(
        msg.sender,
        tokenAmount,
        false
    );
}
