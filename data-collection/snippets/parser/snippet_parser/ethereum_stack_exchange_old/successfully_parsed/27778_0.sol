function distributeToken(address[] addresses, uint256 _value) onlyOwner {
     for (uint i = 0; i < addresses.length; i++) {
         balances[owner] -= _value;
         balances[addresses[i]] += _value;
         Transfer(owner, addresses[i], _value);
     }
}
