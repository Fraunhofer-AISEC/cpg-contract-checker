address addr = address(contractA); 
bytes memory sig = abi.encodeWithSignature("getIntValue()"); 


assembly {
  let result := delegatecall(sub(gas, 10000), addr, add(sig, 0x20), mload(sig), 0, 0)

  let size := returndatasize

  let ptr := mload(0x40)
  returndatacopy(ptr, 0, size)

  
  
  switch result case 0 { revert(ptr, size) }
  default { return(ptr, size) }
}
