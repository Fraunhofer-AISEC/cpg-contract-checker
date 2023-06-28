function join() public payable {
    if (members[msg.sender] == true) {
        revert AlreadyMember(msg.sender);
    }
    
    if (msg.value != 1 ether) {
        revert WrongInitiationFee(msg.sender);
    }
    members[msg.sender] = true;
    memberCount++;
    emit MemberJoined(msg.sender);
    
}
