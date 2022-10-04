 pragma solidity ^0.5.0;
 contract Call_verify{

  function call_ecover(bytes32 r, bytes32 s, uint8 v, 
  bytes32 hash)external pure returns (address){
  bytes memory prefix = "\x19Ethereum Signed 
  Message:\n32";    
  bytes32 prefixedHash = 
  keccak256(abi.encodePacked(prefix,hash));  
  return ecrecover(prefixedHash, v, r, s);    
  } 
 
}
