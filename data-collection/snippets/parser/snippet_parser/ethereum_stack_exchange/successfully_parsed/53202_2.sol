function send(address _from, address _to) public payable {
    require(msg.value == 1 ether);
    _to.transfer(msg.value);
    emit Payment( _from, _to, msg.value);
}
