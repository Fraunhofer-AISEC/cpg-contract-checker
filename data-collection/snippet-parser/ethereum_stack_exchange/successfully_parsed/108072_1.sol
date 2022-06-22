  
  function buyTokens(uint256 _id, address _beneficiary) public payable open(_id) {

    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);

    
    uint256 tokens = _getTokenAmount(weiAmount);

    
    Session storage sesh = sessions[_id];
    sesh.raised = sesh.raised.add(weiAmount);

    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(
      msg.sender,
      _beneficiary,
      weiAmount,
      tokens
    );

    _forwardFunds();
    _postValidatePurchase(_beneficiary, weiAmount);
  }
