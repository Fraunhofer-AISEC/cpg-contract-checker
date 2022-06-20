    require (_value%100 == 0);
    uint fee = _value/1000; 
    require (balanceOf[msg.sender] > _value) ;
    require (balanceOf[_to] + _value > balanceOf[_to]);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += (_value-fee);
    balanceOf[thirdPartyAddress] += value;
