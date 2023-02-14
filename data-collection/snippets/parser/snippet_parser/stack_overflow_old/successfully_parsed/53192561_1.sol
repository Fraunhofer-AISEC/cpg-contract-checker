function buyTokens(address _beneficiary) public payable {
        uint256 weiAmount = msg.value;
        
        uint256 tokens = _getTokenAmount(weiAmount);
        weiRaised = weiRaised.add(weiAmount);
        _processPurchase(_beneficiary, tokens);
        emit TokenPurchase(
            msg.sender,
            _beneficiary,
            weiAmount,
            tokens
        );
        _forwardFunds();
   }
