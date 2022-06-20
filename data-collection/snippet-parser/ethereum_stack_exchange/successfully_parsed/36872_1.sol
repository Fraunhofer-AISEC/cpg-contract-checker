function usingMemoryArray() {
  
  

  
  uint[4] memory temp;

  
  (temp[0], temp[1], temp[2]) = otherContract.getter(param);

  
  temp[3] = someOperation(temp[0], temp[1], temp[2]);

  
}
