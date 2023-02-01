struct MyStruct {
  uint a;
  uint b;
  uint c;
}

MyStruct public myStruct = MyStruct(1, 2, 3);

function getStruct()
  constant
  returns (uint a, uint b, uint c)
{
  return (myStruct.a, myStruct.b, myStruct.c);
}
