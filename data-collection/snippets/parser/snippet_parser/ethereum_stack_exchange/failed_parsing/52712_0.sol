function approveAndCall(address _spender, uint256 _value, bytes 
_extraData) public
    returns (bool success) {
    allowance[msg.sender][_spender] = _value;
    tokenRecipient spender = tokenRecipient(_spender);
    if (approve(_spender, _value)) {
    spender.receiveApproval(msg.sender, _value, this, _extraData);
    return true;
}
