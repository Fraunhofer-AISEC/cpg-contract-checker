function sendMultiple(address[] memory _redemptions, uint[] memory _values) public returns (bool) {
    require(_redemptions.length == _values.length);

    uint256 senderBalance = balances[msg.sender];
    uint256 length = _redemptions.length;
    for (uint i = 0; i < length; i++) {
        uint value = _values[i];
        address recipient = _redemptions[i];

        require(senderBalance >= value);
        if (msg.sender != _redemptions[i]) {
            senderBalance -= value;
            balances[recipient] += value;
        }

        emit Transfer(msg.sender, recipient, value);
    }

    balances[msg.sender] = senderBalance;
    return true;
}
