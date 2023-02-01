function participate() external payable {
    require(msg.value == 2 ether,"The amount must be equal to 2 Ethers");
    if (_participantMap[msg.sender].participantAddr == address(0)) {
        _participantMap[msg.sender] = Participant(msg.sender, 1);
    } else {
        _participantMap[msg.sender].noOfLotts += 1;
    }
}
