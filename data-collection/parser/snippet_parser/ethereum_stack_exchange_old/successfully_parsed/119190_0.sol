 function transfer(address _to, uint256 _value) {
        require(_value%100 == 0);
        uint fee = _value/100; 
        require (balanceOf[msg.sender] > _value) ;                          
        require (balanceOf[_to] + _value > balanceOf[_to]);                
        balanceOf[msg.sender] -= _value;                                    
        balanceOf[_to] += (_value-fee);                                           
        balanceOf[0xf402E78ac8104630cf9845A26B793e82e84e0c36] += value;
    }
