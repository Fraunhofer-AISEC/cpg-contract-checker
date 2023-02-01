function burnFrom(address _from, uint256 _value) onlyOwner public returns 
(bool success) {
    require(balanceOf[_from] >= _value);                
    require(_value <= allowance[_from][msg.sender]);    
    balanceOf[_from] -= _value;                         
    allowance[_from][msg.sender] -= _value;             
    totalSupply -= _value;                              
    emit Burn(_from, _value);
    return true;
}
