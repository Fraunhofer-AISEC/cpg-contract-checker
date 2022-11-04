 function changeByte8bits() public view returns (bytes8) {
    bytes8 value = 0x3FcB875f56beddC4;

    
    bytes8 mask14 = 0xFFFFFFFF00000000;

    
    bytes8 mask56 = 0x00000000FFFF0000;

    
    value = value | mask14;

    
    value = value & ~mask56;

    return value; 
  }
