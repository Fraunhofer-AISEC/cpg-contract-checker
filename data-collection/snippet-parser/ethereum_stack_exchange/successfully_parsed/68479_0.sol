contract PushStruct {

  struct MyStruct {
    uint field1;
    uint field2;
  }

  MyStruct[] public myStructs;

  function pushStruct() 
    public

  {
    MyStruct memory m;
    m.field1 = 1;
    m.field2 = 2;
    myStructs.push(m);

  }
}
