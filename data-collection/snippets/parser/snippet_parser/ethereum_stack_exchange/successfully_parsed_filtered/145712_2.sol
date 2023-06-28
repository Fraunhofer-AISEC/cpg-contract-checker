

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";


contract TestVerify {

  function verify(string memory message, uint256 nonce, bytes memory _signature) public pure returns (address){
    bytes32 messageEncodedPacked = getMessageHash(message, nonce);

    bytes32 _ethSignedMessageHash = ethSignedMessageHash(messageEncodedPacked);
    address signer = ECDSA.recover(_ethSignedMessageHash, _signature);

    return signer;
  }


  function getMessageHash(string memory message, uint256 nonce) private pure returns (bytes32) {
    return keccak256(abi.encodePacked(message, nonce));
  }

  function ethSignedMessageHash(bytes32 _hash) private pure returns (bytes32) {
    return (keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)));
  }

  function getEncodePacked(string memory message, uint256 nonce) public pure returns (bytes memory) {
    return abi.encodePacked(message, nonce);
  }
}
