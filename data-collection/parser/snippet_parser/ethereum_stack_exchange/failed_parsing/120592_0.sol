
struct MyStruct {
  uint constant number;
  int immutable integer;
}


struct MyStruct {
  uint number;
  int integer;
}

MyStruct constant constantMyStruct = MyStruct(1, -1);
MyStruct immutable immutableMyStruct;


immutableMyStruct = MyStruct(1, -1);
