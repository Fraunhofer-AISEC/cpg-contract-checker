function checkUserAllowance() public virtual returns (bool) {
  
 
  IERC20 TOKEN = IERC20("contractAddress"); 
    
  
  uint256 allowance = TOKEN.allowance(msg.sender, address(this));
  require(allowance > 0, "No approved allowance");

  return true;

  }
