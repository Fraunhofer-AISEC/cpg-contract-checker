pragma solidity ^0.4.26;
pragma experimental ABIEncoderV2;

contract crud{
  address owner;
  constructor() public{
  owner = msg.sender;
}
modifier onlyOwner () {
   require(msg.sender == owner);
    _;
}
struct user{
    bytes32 hash_json;
    bytes32 hash_corso;
}
 mapping (bytes32 => user[]) public users;

 
 function setUser(bytes32 _hash, bytes32 _hash_json, bytes32 _hash_corso) onlyOwner  public {
     user memory usr;
     usr.hash_json=_hash_json;
     usr.hash_corso= _hash_corso;
     users[_hash].push(usr);
 }
 
 function getUser(bytes32 _hash) view public returns (user[] memory) {
     return users[_hash];
 }

 }
