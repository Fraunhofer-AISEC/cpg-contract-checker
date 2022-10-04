function getEvens() pure external returns(uint[]) {
  uint[] memory evens = new uint[](5);
  
  uint counter = 0;
  
  for (uint i = 1; i <= 10; i++) {
    
    if (i % 2 == 0) {
      
      evens[counter] = i;
      
      counter++;
    }
  }
  return evens;
}
