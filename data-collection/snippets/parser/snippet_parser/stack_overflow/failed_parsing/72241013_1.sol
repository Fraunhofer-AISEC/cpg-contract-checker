function getDistance(uint256 x1, uint256 x2, uint256 y1, uint256 y1, ) private view returns(uint256) {
  return sqrt(((x2 - x1)**2) + ((y2 - y1)**2));
}

function sqrt(uint x) private pure returns (uint y) {
  uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
        y = z;
        z = (x / z + z) / 2;
    }
  } 
