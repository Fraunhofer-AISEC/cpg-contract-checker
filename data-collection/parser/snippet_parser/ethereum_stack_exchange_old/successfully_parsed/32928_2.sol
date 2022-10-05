pragma solidity ^0.4.19;
contract chargingContract {      

function verify(string message, address p, bytes32 hash, uint8 v, bytes32 r, bytes32 s) pure public returns(bool) {
  bytes memory prefix = "\x19Ethereum Signed Message:\n32"; 
  bytes32 prefixedHash = keccak256(prefix, hash);
  bytes32 hashedMessage = sha3(message);
  return ecrecover(prefixedHash, v, r, s) == p && hashedMessage == hash;
 }
}
