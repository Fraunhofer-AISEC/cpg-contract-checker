    require(_to!=0x0);
    require(balance0f[_from] >=_value);
    require(balance0f[_to] + _value >= balance0f[_to]);
    
    uint previousBalances = balance0f[_from] + balance0f[_to];
    
    balance0f[_from] -= _value;
    balance0f[_to] += _value;
    emit Transfer(_from, _to, _value);
