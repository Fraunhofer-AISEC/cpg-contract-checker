function deleteStruct() {
  MyStruct[] storage structs = structArrays[msg.sender];
  MyStruct memory removeMe;

  for (uint i = 0; i < structs.length; i++) {
    if (structs[i] == SOME_CONDITION) {         
      removeMe = structs[i];                    
      structs[i] = structs[structs.length - 1]; 
      structs[structs.length - 1] = removeMe;   
    }
  }

  structs.pop() 
}
