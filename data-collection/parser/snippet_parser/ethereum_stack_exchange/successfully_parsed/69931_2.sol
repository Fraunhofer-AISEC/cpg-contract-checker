function zLength () public view returns (uint r) {
  assembly {
    r := sload (2)
  }
}

function zElement (uint i) public view returns (uint r) {
  assembly {
    mstore (0, 2)
    r := sload (add (keccak256 (0, 32), i))
  }
}
