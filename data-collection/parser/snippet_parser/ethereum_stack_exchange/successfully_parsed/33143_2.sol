function getScore(address _a) public returns (uint){
  return scores[_a] + scoreIncrement;
}
