function transferN (address _to, uint256 _value) public returns (bool success) {
    require (_to != address(0x0));  

    _transfer(owner, _to, _value);

    emit Transfer(owmer, _to, _value);

    return true;
}
