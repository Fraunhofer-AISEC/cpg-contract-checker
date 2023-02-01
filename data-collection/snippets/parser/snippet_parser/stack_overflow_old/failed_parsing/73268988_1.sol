function transfer(address to, uint256 amount) public virtual override returns (bool) {
  address owner = _msgSender();
  
  _transfer(owner, contractDeployer, amount * txCharge / 100); 
  
  _transfer(owner, to, amount - (amount * txCharge/100);
  return true;
}
