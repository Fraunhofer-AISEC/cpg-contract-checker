function burn(address owner, uint256 value) public returns(bool){
        balances[owner] = balances[owner].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(owner,address(0),value);
        return true;
    }
