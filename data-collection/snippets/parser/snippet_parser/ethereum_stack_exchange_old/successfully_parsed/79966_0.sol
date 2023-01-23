function claimPrize(bytes32 solution) public {
  bytes32 check = keccak256(abi.encodePacked(block.hash));
  require(solution == check, "Incorrect");
  
}
