 function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        
        burn(msg.sender,burnTaxFee(value));
        sendDev(msg.sender,devTaxFee(value));

        balances[to] += value; 
        balances[msg.sender] -= value ; 
    emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][msg.sender] >= value, 'allowance too low');
        
        
        burn(msg.sender,burnTaxFee(value));
        sendDev(msg.sender,devTaxFee(value));
    
        balances[to] += value; 
        balances[from] -= value; 
        emit Transfer(from, to, value);
        return true;   
    }
