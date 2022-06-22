function vote(bytes32 merkleHash, bytes32 randomHash) external votePeriod returns (uint) {
    votes.push(Vote (msg.sender, merkleHash, randomHash));
    return votes.length - 1;
}
