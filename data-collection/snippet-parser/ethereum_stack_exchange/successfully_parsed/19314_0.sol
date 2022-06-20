function transferFrom(address _from, address _to, uint256 _value) returns (bool success)             
        {
            if (balanceOf[_from] < _value) 
            {
                throw;                                              
            }                 
            if (balanceOf[_to] + _value < balanceOf[_to]) 
            {
                throw;                                              
            }  
            if (_value > allowance[_from][msg.sender]) 
            {
                throw;                                              
            }   
            balanceOf[_from] -= _value;                             
            balanceOf[_to] += _value;                               
            allowance[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        }
function sell(uint256 TokensAmount) afterDeadline
        {

            uint256 amount = TokensAmount;
            if (balanceOf[msg.sender] < amount ) 
            {
                throw;                                              
            }        
            uint256 revenue = amount * sellPrice;
            balanceOf[msg.sender] -= amount;                        
            balanceOf[Killer] += amount;                            
            KilledTokens[msg.sender] += amount;
            KilledTillNow += amount;
            address _to = msg.sender;
            address _from = owner;
            uint256 _value = revenue;

            if (!msg.sender.send(revenue)) 
            {                                                       
                throw;                                              
            } 
            else 
            {  
                transferFrom(_from, _to, _value)
                Transfer(msg.sender, Killer, amount);               
                return;                                             
            }
        }
