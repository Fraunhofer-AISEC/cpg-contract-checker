pragma solidity ^0.4.24;

contract MyContract {

  event AddFile(address indexed owner, bytes32 digest, bytes2 hashFunction, uint8 size, bytes4 storageEngine);

  function addFile(bytes32 _digest, bytes2 _hashFunction, uint8 _size, bytes4 _storageEnginge) public {
    emit AddFile(msg.sender, _digest, _hashFunction, _size, _storageEngine);
  }
}
