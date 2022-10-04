function vote(bool inFavor) {
    var votes = shares[msg.sender];
    
    emit VoteCast(msg.sender, votes, inFavor);
}
