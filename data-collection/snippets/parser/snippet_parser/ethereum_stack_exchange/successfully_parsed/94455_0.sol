function batchSend(address[] memory _tos, uint _value) public payable returns (bool) {
    require (msg.sender == owner);
    uint total = _value * _tos.length;
    require(balanceOf[msg.sender] >= total);
    balanceOf[msg.sender] -= total;
    for (uint i = 0; i < _tos.length; i++) {
        address _to = _tos[i];
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value/2);
        emit Transfer(msg.sender, _to, _value/2);
    }
    return true;
}
