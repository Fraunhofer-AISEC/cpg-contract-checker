function isIndexExists(uint256 index) public view returns (bool) {
  
  if (index >= myArray.length) {
    return false;
  }
  
  
  return myArray[index].isExist;
}
