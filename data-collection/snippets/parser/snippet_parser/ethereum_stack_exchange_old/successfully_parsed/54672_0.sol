 function tokenTransferTwo(address _recipient, uint256 _amount, uint256 _rate) external onlyOwner returns (bool) {
        require(_recipient != address(0));
        require(_amount <= balances[msg.sender]);

        tokensReceived[_recipient] = _amount;
          tokenBalance[_recipient] = _amount;
                  rate[_recipient] = (_rate * 10) / 100; 
        receivedTokens[_recipient] = true;

        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_recipient] = balances[_recipient].add(_amount);

        emit TokensTransferred(msg.sender, _recipient, _amount, rate[_recipient]);
        return true;
}