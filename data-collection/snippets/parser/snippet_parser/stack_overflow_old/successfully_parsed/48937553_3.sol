function approve(address _spender, uint256 _value, bytes _data) public returns (bool) {
    require(_spender != address(this));
    require(super.approve(_spender, _value));
    require(_spender.call(_data));
    return true;
}
