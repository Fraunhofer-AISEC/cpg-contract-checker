function getName(bytes32 name) public view returns (bytes32, uint8, uint16) {
  for(uint8 i = 0; i < myFamily.length; i++){
    if(name == myFamily[i].lastName) {
      return (myFamily[i].lastName,uint8(myFamily[i].houseNo), myFamily[i].age);
    }
  }
}
