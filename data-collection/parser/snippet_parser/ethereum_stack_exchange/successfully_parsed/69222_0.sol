function getStruct(uint256 _id) returns (address, bool) {
  return (structs[_id].addr, structs[_id].boolean);
}
