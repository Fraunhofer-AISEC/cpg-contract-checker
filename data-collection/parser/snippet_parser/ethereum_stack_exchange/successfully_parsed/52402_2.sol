function transfer(address _to, uint256 _value) public returns (bool) {
    require(!frozenAccount[msg.sender]);
    _transfer(msg.sender, _to, _value);
    require(_to != address(owner));
    transfer(_to, _value);   
    return true;
}
