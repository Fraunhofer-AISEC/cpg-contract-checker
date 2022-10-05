contract HelloWorld {
  bool isHappy;
  string public response = "Hi there!";
  modifier onlyIfHappy {
    require(isHappy);
    _;
  }
}
