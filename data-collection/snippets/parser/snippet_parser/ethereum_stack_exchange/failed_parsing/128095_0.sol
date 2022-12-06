struct MyStruct {
   uint x;
   uint y;
}

MyStruct storage myStruct = MyStruct({
   x: 11,
   y: 12
});

bytes memory data = abi.encode(myStruct, (MyStruct));
