pragma solidity ^0.4.18;

contract MyInfo {

  struct Info {
    bytes32 id;
    bytes32 name;
  }
  bytes32[] infoIDs;
  mapping(bytes32 => Info) infos;
  function addInfo(bytes32 _name) public
     returns(bool success) {

     bytes32 ID = keccak256(_name);
     infoIDs.push(ID);
     infos[ID].id = ID;
     infos[ID].name =_name;
     return true;
  }
  function getInfoIDs() public view returns(bytes32[] ids) {
    return infoIDs;
  }
}
