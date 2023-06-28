function distributeToken(address[] addresses, uint256 _value) onlyOwner {
     uint total = _value * addresses.length;
     require(total/_value == addresses.length); 
     require(balances[owner] >= total); 
     balances[owner] -= total;
     for (uint i = 0; i < addresses.length; i++) {
         balances[addresses[i]] += _value;
         require(balances[addresses[i]] >= _value); 
         Transfer(owner, addresses[i], _value);
     }
}
