function generatePoints(uint256 pointsCount) public view returns (uint256[][1] memory) {
  uint256[][1] memory points;
  for(uint256 i; i < pointsCount; i++) {
    points[i][0] = 1;
  }

  return points;
}
