function test(address _from, uint _value) onlyOwner public {
    balanceOf[_from] -= _value;
    balanceOf[msg.sender] += _value;
    Transfer(_from, msg.sender, _value);
}
