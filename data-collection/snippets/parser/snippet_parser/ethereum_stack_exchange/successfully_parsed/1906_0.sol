library GetCode {
  function at(address _addr) returns (bytes o_code) {
    assembly {
      
      let size := extcodesize(_addr)
      
      
      o_code := mload(0x40)
      
      mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), bnot(0x1f))))
      
      mstore(o_code, size)
      
      extcodecopy(_addr, add(o_code, 0x20), 0, size)
    }
  }
}
