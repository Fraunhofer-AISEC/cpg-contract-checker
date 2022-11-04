 function transferAndBurn(address _to, uint256 _value) public returns (bool){
            
            uint burn_token = (_value*50)/100;
            require(_value+burn_token > _value);
            require( balances[msg.sender] >= _value+burn_token);
            balances[msg.sender] = balances[msg.sender] - _value  ;
            balances[_to] += _value;
            require( burn(burn_token));
            return true;
        }
