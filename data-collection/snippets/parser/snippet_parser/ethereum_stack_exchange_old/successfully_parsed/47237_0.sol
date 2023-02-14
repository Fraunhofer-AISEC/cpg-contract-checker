function setEnergy(address dev, uint256 energy) public returns (bool) {
    require(dev != address(0));

    amount[dev].energyValue = amount[dev].energyValue + energy;
    energyTotalSupply = energyTotalSupply + energy;

    emit setEnergyEvent(dev, energy);

    return true;
  }
