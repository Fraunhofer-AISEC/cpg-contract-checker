function setNickname(bytes32 _nickname) public payable {
    lords[msg.sender].lordAddr = msg.sender;
    lords[msg.sender].nickname = _nickname;
    emit SetNickname(msg.sender, _nickname);
}
