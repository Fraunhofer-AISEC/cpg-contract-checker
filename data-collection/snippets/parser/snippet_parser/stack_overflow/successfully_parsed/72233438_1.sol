function _generateXPoints(uint256 pointsCount) public view returns (uint256[] memory) {
    uint256[] memory points;

    for(uint256 i; i < pointsCount; i++) {
      points[i] = 1
    }

    return points;
  }
