function test() internal {
  stateVariable = 20;
  uint num = 20;
  assembly {
     mstore(0x00, num)
     return(0x00, 0x20)
  }
}
