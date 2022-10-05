struct myStruct {
  address foo;
  uint256 bar;
}
myStruct[] private myStructs;

function getMyStruct() public view returns(myStruct[] memory) {
  return myStruct;
}
