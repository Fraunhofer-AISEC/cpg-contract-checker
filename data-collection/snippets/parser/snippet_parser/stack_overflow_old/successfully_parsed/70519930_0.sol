function getPower() payable public {
    require(msg.value > 0, "The amount can't be 0");
    require(election_state == ELECTION_STATE.OPEN);
    require(votingPeriod > block.timestamp);
    uint amountSent = msg.value;
    
    
    voters[msg.sender].power = msg.value * 10;
    payable(msg.sender).transfer(amountSent);
}
