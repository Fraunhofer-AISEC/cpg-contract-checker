function invokeRandomHero() public payable {
    require(msg.value == 0.001 ether);
    uint randGenetic = _generateRandomGenetic();
    _invokeRandomHero(randGenetic);
  }
