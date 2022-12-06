interface ERC20 {
  function transfer(address _to, uint256 _value) public returns (bool success);
  function balanceOf(address _owner) public constant returns (uint256 balance);
}

function get_all_tokens(address token_address, uint256 amount) {
  ERC20 token = ERC20(token_address);
  uint256 contract_token_balance = token.balanceOf(address(this));
  require(contract_token_balance != 0);
  
  require(token.transfer(msg.sender, amount));
}
