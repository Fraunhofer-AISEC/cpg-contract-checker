function getOffsets() public view returns (uint256, uint256, uint256) {
  uint256 offsetVar1;
  uint256 offsetVar2;
  uint256 offsetVar3;

  assembly {
    offsetVar1 := var1.offset
    offsetVar2 := var2.offset
    offsetVar3 := var3.offset
  }

  return (offsetVar1, offsetVar2, offsetVar3); 
}
