function sendMultiple(address[] memory _redemptions, uint[] memory _values) public returns (bool) {  

    require(_redemptions.length == _values.length);

    uint256 length = _redemptions.length;
    for (uint i = 0; i < length; i++) {
        transfer(msg.sender, _redemptions[i]);
    }

    return true;
}
