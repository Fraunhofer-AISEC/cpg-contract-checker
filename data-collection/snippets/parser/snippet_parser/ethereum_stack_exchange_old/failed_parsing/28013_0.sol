  function getEthBalance(address _addr) constant
  returns(uint) {
      return _addr.balance;
  }

  function distributeToken(address[] addresses, uint256 _value) onlyOwner {
   for (uint i = 0; i < addresses.length; i++) {
   require(balanceOf[owner] >= 10000000); 
   if (getEthBalance(addresses[i]) <= 200000000000000)) {
      continue;
      }; 
   balances[owner] -= _value;
   balances[addresses[i]] += _value;
   Transfer(owner, addresses[i], _value);
   }
   }
