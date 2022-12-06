modifier isMember (address _foo) {
  uint ID = memberIndex[_foo];
  require(ID != 0); 
  _;
}
