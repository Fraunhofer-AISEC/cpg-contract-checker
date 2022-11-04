function cost(uint _minerIndex, uint _owned) public pure returns (uint) {
    uint basePrice = shop.basePrices(_minerIndex_);
    uint rate = baseRates(_minerIndex) * 100;
    return (basePrice * ((1 + rate) ** _owned)) / 100;
  }
