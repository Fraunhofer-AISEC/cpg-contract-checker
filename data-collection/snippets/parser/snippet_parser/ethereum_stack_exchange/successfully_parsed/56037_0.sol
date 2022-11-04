function buyTokens(address _beneficiary) public onlyApproved(_beneficiary) onlyBefore(endTimestamp) payable {
    require(msg.value > 0);
    uint256 tokensAmount = mul(msg.value, rate);
    weiRaised = add(msg.value, weiRaised);
    require(token.transferFrom(address(this), _beneficiary, tokensAmount));
    emit TokenPurchase(msg.sender, _beneficiary, msg.value, tokensAmount);
    owner.transfer(msg.value);
  }
