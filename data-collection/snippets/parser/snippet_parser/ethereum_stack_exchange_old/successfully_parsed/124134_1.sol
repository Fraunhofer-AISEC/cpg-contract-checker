function getSlots() public view returns (uint256, uint256, uint256) {
  uint256 slotVar1;
  uint256 slotVar2;
  uint256 slotVar3;

  assembly {
    slotVar1 := var1.slot
    slotVar2 := var2.slot
    slotVar3 := var3.slot
  }

  return (slotVar1, slotVar2, slotVar3); 
}
