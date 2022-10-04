
pragma solidity ^0.4.0;
contract Admin {
  bool public contractStatus = false;
  address public owner;

  
  struct AdminDetails {
      string name;
      string details;
      bool state;
      address addr;
      uint group;
  }

  
  function Admin() {
    contractStatus = true;
    owner = msg.sender;
  }

  
  
  
  
  function checkCreatePermission(bytes1 permVal) returns (bool permCheck) {
    return ((permVal & 0x08) == 0x08);
  }

  function isOwned(address ownerAddr) returns (bool _owned) {
    return (owner == ownerAddr);
  }
}
