function indexOf(uint256[] memory arr, uint256 searchFor) private returns (uint256) {
  for (uint256 i = 0; i < arr.length; i++) {
    if (array[i] == searchFor) {
      return i;
    }
  }
  return -1; 
}
