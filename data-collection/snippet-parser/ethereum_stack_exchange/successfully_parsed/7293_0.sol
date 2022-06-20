function transfer(address _to, uint256 _value) {
    
    if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to])
        throw;

    
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
}
