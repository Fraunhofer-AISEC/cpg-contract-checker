address iterator = lastAccess;
uint256 iteration = 0;

while(iterator != 0x0) {
  if(iteration++ > _maxIterations){
    lastAccess = iterator;
    iterator = 0x0; 
  } else {
    if(data[iterator].x == X){
      ...
    iterator = 0x0; 
    } else {
      iterator = users[iterator];
    }
  }
}
