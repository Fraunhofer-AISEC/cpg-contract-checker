pragma solidity ^0.4.21;


contract test {
  address public requesting;

  struct simpleStruct {
    bytes32 desc;
    uint256 startTime;
  }

  struct itmap
  {
    mapping(bytes32 => IndexValue) data;
    KeyFlag[] keys;
    uint size;
  } 

  struct IndexValue { uint keyIndex; simpleStruct value; }
  struct KeyFlag { bytes32 key; bool deleted; }

  itmap data;

  function test() public {
      requesting = msg.sender;
  }

  function addSimpleStruct(bytes32 key, bytes32 _desc) public { 

    require(msg.sender == requesting); 

    simpleStruct storage newStruct;
    newStruct.desc = _desc; 
    newStruct.startTime = now; 
    insert(data, key, newStruct); 
  }

  function insert(itmap storage self, bytes32 key, simpleStruct storage value) internal returns (bool replaced)
  {
    uint keyIndex = self.data[key].keyIndex;
    self.data[key].value = value;
    if (keyIndex > 0)
      return true;
    else
    {
      keyIndex = self.keys.length++;
      self.data[key].keyIndex = keyIndex + 1;
      self.keys[keyIndex].key = key;
      self.size++;
      return false;
    }
  }
}
