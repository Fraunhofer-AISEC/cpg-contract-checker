function buy() public payable returns (uint){
       require(msg.sender != address(0));
       require(msg.value >= 0);
       uint amount = msg.value.mul(1 ether).div(buyPrice);
       require(amount > 0);
       require(balances[this] >= amount);
       uint oldBalance = balances[this].add(balances[msg.sender]);
       balances[this] = balances[this].sub(amount);
       balances[msg.sender] = balances[msg.sender].add(amount);
       uint newBalance = balances[this].add(balances[msg.sender]);
       assert(newBalance == oldBalance);
       Transfer(this, msg.sender, amount);
       return amount;    
  }
