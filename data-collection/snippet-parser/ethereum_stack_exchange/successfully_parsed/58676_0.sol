function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());

    uint256 weiAmount = msg.value;

    uint256 tokens = weiAmount.mul(getRate());

    weiRaised = weiRaised.add(weiAmount);

    token.issue(address(vault), tokens);
    vault.deposit.value(msg.value)(beneficiary, tokens);

    emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);

    forwardFunds();
}
