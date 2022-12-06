  bool constant MAPPING = false;
  bool constant OFFSET = true;

  function changeState(
    bytes32 baseSlot,
    bool[] memory mask,
    bytes32[] memory keys,
    bytes32 value
  )
    public
  {
    require(mask.length == keys.length, "bad-num-keys");
    bytes32 slot = baseSlot;

    for (uint256 i; i < keys.length; i++) {
      if (mask[i] == MAPPING) {
        slot = keccak256(abi.encode(keys[i], slot));
      }
      if (mask[i] == OFFSET) {
        slot = bytes32(add(uint256(keys[i]), uint256(slot)));
        if (i != keys.length - 1) { 
          slot = keccak256(abi.encode(slot));
        }
      }

    assembly {
      sstore(slot, value)
    }
  }
}