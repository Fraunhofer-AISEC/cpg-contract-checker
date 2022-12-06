function _transfer(address sender,address recipient,uint256 amount) 
  internal 
  virtual 
  override 
  whenNotPaused 
{
    super._transfer(sender, recipient, amount);
}
function _approve(address owner,address spender,uint256 amount) 
 internal
 virtual 
 override
 whenNotPaused 
{
    super._approve(owner, spender, amount);
}
function _burn(address account, uint256 amount)
 internal
 virtual
 override
 whenNotPaused
{
    super._burn(account, amount);
}

