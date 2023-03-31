function push(
    History storage self,
    uint8 operation
    uint256 delta
) internal returns (uint256, uint256) {
      if(operation == 1) {
          return push(self, latest(self) + delta);
     }
    return push(self, latest(self) - delta);
}
