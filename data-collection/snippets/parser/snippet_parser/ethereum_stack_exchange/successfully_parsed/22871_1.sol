pragma solidity ^0.4.11;

contract Nest {

  struct IpfsHash {
    bytes32 hash;
    uint hashSize;
  }

  struct Member {
    IpfsHash ipfsHash;
  }

  mapping(uint => Member) members;

  function addMember(uint id, bytes32 hash, uint size) public returns(bool success) {
    members[id].ipfsHash.hash = hash;
    members[id].ipfsHash.hashSize = size;
    return true;
  }

  function getMember(uint id) public constant returns(bytes32 hash, uint hashSize) {
    return(members[id].ipfsHash.hash, members[id].ipfsHash.hashSize);
  }
}
