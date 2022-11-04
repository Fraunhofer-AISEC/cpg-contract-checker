
mapping(address=>mapping(address=>uint)) public allowance;

function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        
        require(_value <=allowance[_from][msg.sender]);
        
        balanceOf[_to]+=_value;
        balanceOf[_from]-=_value;
        allowance[_from][msg.sender]-=_value;
        
        emit Transfer(_from,_to,_value);
        return true;
    }
