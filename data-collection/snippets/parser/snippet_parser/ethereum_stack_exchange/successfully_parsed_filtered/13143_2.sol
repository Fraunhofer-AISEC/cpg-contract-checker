contract cutByte32 {

  
  

  function cut(bytes32 sha) constant returns (bytes16 half1, bytes16 half2) {
    assembly {
      let freemem_pointer := mload(0x40)
      mstore(add(freemem_pointer,0x00), sha)
      half1 := mload(add(freemem_pointer,0x00))
      half2 := mload(add(freemem_pointer,0x10))
    }
  }
}
