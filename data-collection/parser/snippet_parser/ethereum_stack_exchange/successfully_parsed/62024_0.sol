pragma solidity ^ 0.4.15;

contract Sample{

  struct Info
  {
    address pubKey;        
    bytes32 Id;
  }

  mapping(address => Info) public userMap;

  
  function register(bytes32 orgId, address pubKey) public returns(bool){
    if (pubKey == 0x0 || orgId == 0x0 ) {
        revert("Pub Key & Org Id are mandatory");
    }
    if (userMap[pubKey].pubKey == pubKey) {
        revert("User already exists");
    }
    userMap[pubKey].pubKey = pubKey;
    userMap[pubKey].orgId = orgId;
    return true;
  }
  
  function getUser(address pubKey) public returns(bytes32 orgId){
    orgId = userMap[pubKey].orgId;
  }
}
