
pragma solidity >=0.7.0;

import "./struct.sol";

contract storageFactory{

  function createSimpleStorageContract()  public{
    struct simpleStorage = new struct();
  }
}
