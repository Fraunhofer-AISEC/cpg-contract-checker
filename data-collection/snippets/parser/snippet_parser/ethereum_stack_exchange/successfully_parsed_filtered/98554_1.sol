function burn(uint256 value) public returns(bool){
        balances[msg.sender] = balances[msg.sender].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(msg.sender,address(0),value);
        return true;
    }
