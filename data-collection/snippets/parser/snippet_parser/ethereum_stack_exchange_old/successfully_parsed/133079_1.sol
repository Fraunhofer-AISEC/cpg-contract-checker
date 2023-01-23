function shiftRightBySigned(int128 toShift, int128 shift) public pure returns(uint128 shifted) {
  if(shift < 0) {
    uint256 shiftUint = uint256(int256(shift * (-1)));
    
    shifted = toShift << shiftUint;
  }
  else {
    uint256 shiftUint = uint256(int256(shift));
    shifted = toShift >> shiftUint;
  }
}
