 function _transfer(address sender, address recipient, uint256 amount) internal {
      uint256 tokenAmountInCurrentContract = amount;
      
 }

 function retrieveCurrentContractTokenAmount() internal returns (bool) {
      
      return balanceOf(address(this));
 }
 
 function balanceOf(address account) external view returns (uint256) {
      return _balances[account];
 }
