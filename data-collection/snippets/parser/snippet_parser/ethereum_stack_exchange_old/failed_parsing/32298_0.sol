event PerformingDrop(uint count);
function drop(address[] addresses, uint256 amount) public onlyOwner {
  uint256 amt = amount * 10**8;
  require(amt > 0);
  require(amt <= SUPPLY_CAP);
  PerformingDrop(addresses.length);

  
  assert(addresses.length <= 1000);
  assert(balances[owner] >= amt * addresses.length);
  for (uint i = 0; i < addresses.length; i++) {
    address recipient = addresses[i];
    if(recipient != NULL_ADDRESS) {
      balances[owner] -= amt;
      balances[recipient] += amt;
      Transfer(owner, recipient, amt);
     }
   }
 }
