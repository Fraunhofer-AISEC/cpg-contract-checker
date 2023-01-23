function appendKeyToMyStruct(uint _myStruct, address key) public ... {
  myStructs[_myStruct].keys.push(key);
}

function getMyStructKey(uint _myStruct, uint row) public ... {
  return myStructs[_myStruct].keys[row];
}
