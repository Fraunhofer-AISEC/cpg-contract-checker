function transfer(address _to, uint256 _value) public
{
    
    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

    
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    
    Transfer(msg.sender, _to, _value);
}
