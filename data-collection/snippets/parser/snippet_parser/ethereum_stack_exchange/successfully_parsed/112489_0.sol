    address payable public owner;
  
uint256 public max_contribution = 50 ether; 
uint256 public min_contribution = 0.1 ether; 

function transfer(address to, uint tokens) public payable returns (bool success) {
    require(msg.value >= min_contribution);
    require(msg.value <= max_contribution);
    balances[msg.sender] = safeSub(balances[msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;

}
