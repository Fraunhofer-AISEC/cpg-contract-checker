   function buy_token(address _to, uint256 numberOfTokens) external payable  returns(uint256) {            
        require(numberOfTokens > 0);
        require(balances[owner] >= numberOfTokens);
        require(balances[_to] + numberOfTokens >= balances[_to]);
        
        balances[_to] = balances[_to].add(numberOfTokens);
        balances[owner] = balances[owner].sub(numberOfTokens);
        emit Transfer(owner, msg.sender, numberOfTokens);
  }
