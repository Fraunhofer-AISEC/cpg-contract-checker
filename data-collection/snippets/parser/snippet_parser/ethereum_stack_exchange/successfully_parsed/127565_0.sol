function performCalculation(uint256 _id) public view returns(uint256) {
      uint256 memory someValue = someMapping[_id];
      return someValue - 10;
}
