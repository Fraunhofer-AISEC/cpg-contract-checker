    function tokenFallback(address _from, uint _value, bytes memory _data) public { 
        require(msg.sender == address(token)); 
        balances[msg.sender] += _value; 
        emit LogTokensReceived(msg.sender, _from, _value, _data);
    }

    function withDrawTokens(uint amount) public {
        uint balance = balances[msg.sender]; 
        require(amount <= balance, "Insufficient funds.");
        balances[msg.sender] = balance - amount;
        emit LogWithdrawal(msg.sender, amount);
        token.transfer(msg.sender, amount); 
    }
}
