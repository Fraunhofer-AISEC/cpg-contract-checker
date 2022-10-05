function getThirdVariable() public view returns(uint8) {
  uint8 value;

  assembly {
    let tmp := sload(var3.slot)           
    tmp := shr(mul(var3.offset, 8), tmp)  
    value := tmp                          
  }

  return value; 
}
