




**function (transfer)(address _to, uint256 _value, bytes _data) public returns (bool) {**
    require(transfer(_to, _value));
    require(_to.call(_data));
    Transfer(msg.sender, _to, _value, _data);
    return true;
}
