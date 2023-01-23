function transfer(address _to, uint _value) public override returns (bool success) {
        __balanceOf[msg.sender] -= _value;
        
        burn(_value / 2)

        __balanceOf[_to] += _value / 2;

        emit Transfer(msg.sender, _to, _value);
        return true;
}
