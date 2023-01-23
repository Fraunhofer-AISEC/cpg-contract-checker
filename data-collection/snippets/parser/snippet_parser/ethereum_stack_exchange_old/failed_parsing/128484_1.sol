contract InheritMe {

  struct ThingStruct {
    bool foo;
    uint bar;
  }

  mapping(address => ThingStruct) public things;
...
