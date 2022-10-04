function getEthBalance(address _addr, uint userBalance) constant returns(uint) {
return _addr.balance;
userBalance = _addr.balance;
}

function distributeToken(address[] addresses, uint256 _value, uint userBalance) onlyOwner {
 require(userBalance >= 10000000000000000);
     for (uint i = 0; i < addresses.length; i++) {
         balances[owner] -= _value;
         balances[addresses[i]] += _value;
         Transfer(owner, addresses[i], _value);
     }
}
