contract A {
    SomeStruct[] private myArray;
    
    function isIndexExists(uint256 index) public view returns (bool) {
      if (myArray[index].isExist) {
        return true;
      } else {
        return false;
      }
    }
}
