contract mySolution {
function sum(uint8 x, uint8 y) external pure returns (bool, uint8) {
  uint8 z = x + y; 
  if (z > type(uint8).max) {
      return(false,0);
  }  else {
      return(true,z);
  } 

}
}