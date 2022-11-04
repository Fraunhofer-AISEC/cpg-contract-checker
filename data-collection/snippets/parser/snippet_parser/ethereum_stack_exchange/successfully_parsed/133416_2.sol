function takeMemoryArray(uint[] memory arr) internal {
  
}
function invokeTakeMemoryArray() external {
 uint[] memory memArray = new uint[](10);
 takeMemoryArray(memArray);
}
