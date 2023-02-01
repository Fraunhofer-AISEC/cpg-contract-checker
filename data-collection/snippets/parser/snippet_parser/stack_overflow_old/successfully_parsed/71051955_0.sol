    function addStaker (uint _stakeAmount) public membership(master, msg.sender) returns(bool) {
    if(!members[msg.sender].alreadyExist) {
        Member memory newMember = Member(msg.sender, true);
        members[msg.sender] = newMember;
        bool sent = payable(address(this)).send(_stakeAmount);
        require(sent, "invalid balance");
        return true;
    } else {
        return false;
    }
}
