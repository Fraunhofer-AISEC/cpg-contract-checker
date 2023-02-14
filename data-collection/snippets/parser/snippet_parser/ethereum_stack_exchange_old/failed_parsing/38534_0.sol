struct MyStruct {
  bytes32 someThing
  bytes32 someOtherThing
}

function updateStruct(bytes32 someThing, bytes32 someOtherThing) public {
  
  if (someThing) {
    struct.someThing = someThing;
  }
  if(someOtherThing) {
    struct.someOtherThing;
  }
}
