
function transferFrom(address from, address to, uint value) public returns(bool) {
      uint allowance = allowed[from][msg.sender];
      require(allowance >= value, 'allowance too low');
      require(balances[from] >= value, 'token balance too low');
      allowed[from][msg.sender] -= value;
      balances[from] -= value;
      balances[to] += value;
      emit Transfer(from, to, value);
      return true;
      
  }
  
  function approve(address spender, uint value) public returns(bool) {
      require(spender != msg.sender, 'spender must not be sender');
      allowed[msg.sender][spender] = value;
      emit Approval(msg.sender, spender, value);
      return true; 

}