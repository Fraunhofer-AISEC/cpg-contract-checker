function setSlot(address addr) {
  assembly { 
    sstore(_IMPL_SLOT.slot, addr)
  }
}
