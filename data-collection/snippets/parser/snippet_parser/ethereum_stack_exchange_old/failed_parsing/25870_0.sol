contact Example {

  mapping (address => uint256) balances;
  ERC20 token = ...; 
  uint256 contract_eth_value = ...;

  ...

  function () payable {
    
    address user = msg.sender;
    
    
    uint256 contract_token_balance = token.balanceOf(address(this));
    
    uint256 tokens_to_withdraw = (balances[user] * contract_token_balance) / contract_eth_value;
    
    contract_eth_value -= balances[user];
    
    balances[user] = 0;
    
    if(!token.transfer(user, tokens_to_withdraw)) throw;
  }
}
