function giveRightToVote(address voter) public payable {
    require(msg.sender == commissioner);
    rightsGiven.push(voter);
}
