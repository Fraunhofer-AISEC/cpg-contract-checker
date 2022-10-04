function cost(uint _minerIndex, uint _owned) public view returns (uint) {
    uint basePrice = 8000;
    uint increaseRate = 7;
    return basePrice * ((1 + increaseRate / 100) ** _owned);
  }
