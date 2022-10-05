function commit(bytes32 committment) public {
  commitments[msg.sender] = commitment; 
}

function claimPrize() public {
  require(block.number >= deadline, "lottery still open");
  bytes32 solution = 
  require(committments[msg.sender] == solution, "You didn't win");
  
}
