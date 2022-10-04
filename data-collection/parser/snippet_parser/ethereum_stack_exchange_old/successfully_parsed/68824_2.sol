contract HelloWorld {
  bool isHappy;
  string response = "Hi there!";
  modifier onlyIfHappy {
    require(isHappy);
    _;
  }
}

contract HelloUniverse is HelloWorld {
  function talk() public view onlyIfHappy returns(string memory) {
    return response;
  }
}
