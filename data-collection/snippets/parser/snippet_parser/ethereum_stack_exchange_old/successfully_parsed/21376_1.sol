pragma solidity ^0.4.11;

contract SampleContract {

  struct ChildStruct {
    bool isPresent;
    bytes32 name;
  }

  struct ParentStruct {
    bool isPresent;
    bytes32 name;
    mapping (bytes32 => ChildStruct) childStructs; 
  }

  mapping(bytes32 => ParentStruct) public parentStructs;

  function insertData(
    bytes32 parentKey, 
    bytes32 parentName, 
    bytes32 childKey, 
    bytes32 childName)
    public 
    returns(bool success)
  {

    parentStructs[parentKey].isPresent = true;
    parentStructs[parentKey].name = parentName;
    parentStructs[parentKey].childStructs[childKey].isPresent = true;
    parentStructs[parentKey].childStructs[childKey].name = childName;
    return true;
  }

  function getChild(bytes32 parentKey, bytes32 childKey) public constant returns(bool isPresent, bytes32 name) {
    return (parentStructs[parentKey].childStructs[childKey].isPresent, parentStructs[parentKey].childStructs[childKey].name);
  }

}
