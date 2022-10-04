contract Foo {
  uint internal x; 
  mapping (uint => address) internal y; 
  uint [] internal z; 

  function zElement (uint key) public view returns (uint r) {
    assembly {
      sload(keccak256(add(key, y_slot), 32))
    }
  }
}
