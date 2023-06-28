function transfer(address _to, uint256 _value) returns (bool success) {
    require(balanceOf[msg.sender] >= _value);
    
    
    
    
    

    require(balanceOf[_to] + _value >= balanceOf[_to]);
    

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    Transfer(msg.sender, _to, _value);
    return true;
}
