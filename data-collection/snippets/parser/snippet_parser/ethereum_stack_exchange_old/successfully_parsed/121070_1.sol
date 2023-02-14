function vote(address candidate, uint jsTime) public {
    require(voters[msg.sender] != true, "User has already voted in this election");
    require(jsTime > votingStart, "Voting period has not yet started");
    require(jsTime < votingEnd, "Voting period has concluded");

    candidates[candidate].votes++;
    voters[msg.sender] = true;
}
