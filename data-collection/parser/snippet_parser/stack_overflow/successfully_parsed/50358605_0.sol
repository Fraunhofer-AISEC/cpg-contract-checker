function distribution(address[] addresses, uint256 _amount) onlyOwner public {       
    uint256 _remainingAmount = _MaxDistribPublicSupply - _CurrentDistribPublicSupply;
    require(addresses.length <= 255);
    require(_amount <= _remainingAmount);
    _amount = _amount * 1e18;

    for (uint i = 0; i < addresses.length; i++) {
        require(_amount <= _remainingAmount);
        _CurrentDistribPublicSupply += _amount;
        balances[msg.sender] += _amount;
        _totalSupply += _amount;
        Transfer(this, addresses[i], _amount);
    }
}