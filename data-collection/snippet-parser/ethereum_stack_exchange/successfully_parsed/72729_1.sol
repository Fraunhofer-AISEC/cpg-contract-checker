function approveAndCall(address payable _spender, uint256 _value, bytes memory _data) public payable returns (bool) {    
    require(_spender != address(this));   
    this.approve(_spender, _value);    
    (bool success, ) = _spender.call.value(msg.value)(_data);
    require(success);
    return true;   
}
