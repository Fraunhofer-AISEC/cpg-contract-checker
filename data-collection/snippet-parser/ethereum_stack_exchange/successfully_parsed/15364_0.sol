pragma solidity ^0.4.0;

contract test {

  function test() {
  }

  function verify(bytes32 _message, uint8 _v, bytes32 _r, bytes32 _s) constant returns (address) {
   address signer = ecrecover(_message, _v, _r, _s);
   return signer;
  }
}
