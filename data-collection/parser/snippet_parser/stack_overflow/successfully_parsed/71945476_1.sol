function submitHash(bytes hash) public {
    hashes[msg.sender] = hash;
}

function submitAnswer(uint256 colorid, uint256 secret) public {
    require(votesIn, "votes are not all in");
    require(keccak256(abi.encodePacked(colorId, secret)) == hashes[msg.sender], "invalid response");
    votes[colorId] += 1;
}
