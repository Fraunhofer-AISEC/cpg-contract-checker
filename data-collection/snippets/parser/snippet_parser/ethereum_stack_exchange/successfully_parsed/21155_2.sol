contract MyContract {
  enum MyEnum { Foo, Bar }

  event ThingHappened(string _e);

  function getMyEnumKeys() public constant returns (string, string) {
    return ("Foo", "Bar");
  }

  function getMyEnumKeyByValue (MyEnum myEnum) public constant returns (string) {
    if (MyEnum.Foo == myEnum) return "Foo";
    if (MyEnum.Bar == myEnum) return "Bar";
    return "";
  }

  function getMyEnumValueByKey (string myEnum) external constant returns (MyEnum) {
    if (sha3(myEnum) == sha3("Foo")) return MyEnum.Foo;
    if (sha3(myEnum) == sha3("Bar")) return MyEnum.Bar;
    revert();
  }

  function foo(string _e) {
    MyEnum myEnum = getMyEnumValueByKey(_e);
    
    ThingHappened(_e);
  }
}
