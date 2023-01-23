     Transfer(_from, _to, _amount);

     return true;
 }

 
 function transferOwnership(address newOwner)public onlyOwner {

     balances[newOwner] = balances[newOwner].add(balances[owner]);
     balances[owner] = 0;
     owner = newOwner;

 }

 function drain() external onlyOwner {

     owner.transfer(this.balance);

 }
  }
