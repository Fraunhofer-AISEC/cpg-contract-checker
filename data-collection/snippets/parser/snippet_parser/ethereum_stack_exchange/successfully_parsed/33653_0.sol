
function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());

    uint256 weiAmount = msg.value;

    
    uint256 tokens = weiAmount.mul(rate);

    
    weiRaised = weiRaised.add(weiAmount);

    
    ERC20(token).transfer(this, tokens); 

    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);

    forwardFunds();
}
