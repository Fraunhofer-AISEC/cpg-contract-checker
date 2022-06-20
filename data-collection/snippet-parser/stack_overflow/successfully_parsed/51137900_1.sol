pragma solidity ^0.4.13;

contract Test { 
  struct UserProfile {
    string userId;
    mapping(uint256 => uint256) linkage;
  }   

  UserProfile public profile;

  function addLinkage(uint256 id, uint256 value) public {
    profile.linkage[id] = value;
  }
}
