
pragma solidity ^0.8.4;

contract DAOManager {
  mapping(bytes32 => string) public daos;

  function _registerDAO(string memory daoName) public returns(bytes32){
    bytes32 daoUuid = keccak256(abi.encodePacked(daoName, block.number, msg.sender));
    daos[daoUuid] = daoName;
    return daoUuid;
  }
}
