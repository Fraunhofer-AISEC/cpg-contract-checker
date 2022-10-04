function remainder() public pure returns(uint) {
  uint r;
  for(uint i = 1000; i >= 1; i-=4) { 
    r = i;  
  }

  return r;
}
