function isContract(address _address) returns (bool isContract){
  uint32 size;
  assembly {
    size := extcodesize(_address)
  }
  return (size > 0);
}
