modifier restrictTargetType(uint contractType) {
  if (contractTypes[_getFirstArg(msg.data)] != contractType) { throw; }
}

function _getFirstArg(bytes calldata) returns(address result) {
  assembly {
    calldatacopy(mload(0x40), 4, 32)
    result := mload(mload(0x40))
  }
}
