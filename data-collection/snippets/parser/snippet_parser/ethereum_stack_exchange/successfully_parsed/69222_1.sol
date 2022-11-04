function getStruct(uint256 _id) returns (address, bool) {
  require(structElementExists(_id));
  return (structs[_id].addr, structs[_id].boolean);
}
