function transfer(address _toAddress, uint _noOfTokens) public returns (bool){
    require(balanceOf(msg.sender) >= _noOfTokens, "Total balance is less than the number of Tokens asked for !!!");
    balances[_toAddress] +=_noOfTokens;
    balances[msg.sender] -= _noOfTokens;
    emit Transfer(msg.sender,_toAddress, _noOfTokens);
    return true;
    }
    
