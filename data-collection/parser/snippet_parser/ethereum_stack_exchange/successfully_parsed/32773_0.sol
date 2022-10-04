function killContract() constant returns (bool) {
    require(msg.sender == owner);
    selfdestruct(owner);
    return true;
}
