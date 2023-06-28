uint32[100] public people;
uint8 public counter;

function onlyOneVote(uint32 ida) public returns(bool) {
  bool a = autentic(ida);
  if (a == true) {
    people[counter] = ida;
    counter = counter + 1;
  }
  return a;
}

function autentic(uint32 idb) public returns(bool) {
  bool b;
  for(uint i = 0; i< people.length; i++) {
    if (people[i] == idb) {
      b = false;
      break;
    } else {
      b = true;
    }
  }
  return b;
} 
