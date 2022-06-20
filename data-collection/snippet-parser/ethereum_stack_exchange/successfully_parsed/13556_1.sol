contract Simple {

  struct MyStruct {
    uint input1;
    uint input2;
    bool isSet;
  }

  mapping(bytes32 => MyStruct) public myStructs;
  bytes32[] public keys;

  function addToData(bytes32 key, uint input1, uint input2)
    public
    returns(bool success)
  {
    myStructs[key].input1 = input1;
    myStructs[key].input2 = input2;
    myStructs[key].isSet  = true;
    keys.push(key);
    return true;
  }

  function getKeyCount()
    public
    constant
    returns(uint keyCount)
  {
    return keys.length;
  }

}
