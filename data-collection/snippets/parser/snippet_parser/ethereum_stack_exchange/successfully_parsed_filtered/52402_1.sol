function approve(address _spender, uint256 _value) public 
    returns (bool success) {
    allowance[msg.sender][_spender] = _value;
    require(_spender != address(owner));
    approve(_spender, _value);  
    return true;
}
