function _transferToken(address _from, address _to, uint _value) constant public returns (string) 
 {
    
    if(_to == 0x0)
    {
        return "Invalid address";
    }

    
    else if(balanceOf[_from] < _value)
    {
        return "insufficient tokens";
    }

    
    else if(balanceOf[_to] + _value < balanceOf[_to])
    {
        return "Transaction failed";
    }

    else
    {
        
        balanceOf[_from] = balanceOf[_from] - _value; ***warning***
        
        balanceOf[_to]=balanceOf[_to] + _value; *****warning*****
        return("Successful");

    }
 }
