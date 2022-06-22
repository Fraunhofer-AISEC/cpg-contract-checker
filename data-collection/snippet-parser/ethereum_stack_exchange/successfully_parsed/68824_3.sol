contract HelloUniverse {
  bool isHappy;
  string response = "Hi there!";
  modifier onlyIfHappy {
    require(isHappy);
    _;
  }
  function talk() public view onlyIfHappy returns(string memory) {
    return response;
  }
}
