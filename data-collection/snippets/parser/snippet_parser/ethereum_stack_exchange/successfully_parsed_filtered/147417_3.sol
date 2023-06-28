contract StorageP {
    uint256 public number;

    function inc(uint256 i) public {
      number = number + i;
    }
}

contract StorageE {
    uint256 public number;

    function inc(uint256 i) external {
      number = number + i;
    }
}
