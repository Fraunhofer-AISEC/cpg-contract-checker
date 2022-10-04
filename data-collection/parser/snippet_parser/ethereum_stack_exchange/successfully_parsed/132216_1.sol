function getVehicle(uint256 vid) external view returns(string memory model, uint256 wheelCount, uint256[] memory wheels) {
  model = vehicles[vid].model;
  wheelCount = vehicles[vid].wheelCount;
  wheels = new uint256[](wheelCount);
  for (uint256 i=0; i < wheelCount; i++) {
    wheels[i] = vehicles[vid].wheels[i];
  }
}
