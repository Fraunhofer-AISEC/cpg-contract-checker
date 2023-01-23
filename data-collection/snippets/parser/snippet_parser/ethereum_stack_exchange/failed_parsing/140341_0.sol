struct myStruct {
   uint a;
   uint b;
}

myStruct[] memory arrayOfStructs = ....

bytes memory data = abi.encode(123 , arrayOfStructs);
