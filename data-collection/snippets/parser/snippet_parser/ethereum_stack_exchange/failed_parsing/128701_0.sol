contract MyContract is OwnableUpgradeable {
    ...
    struct MyStruct {
      uint a;
      uint b;
    }
    ...
    
    mapping(address => MyStruct) public myMapping;
}
