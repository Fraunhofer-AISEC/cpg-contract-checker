contract B is A {
  function todo(uint256 index) public view returns (bool) {
    if (isIndexExists(index)) {
      
    } else {
      revert("Index in not exist")l
    }
  }
}
