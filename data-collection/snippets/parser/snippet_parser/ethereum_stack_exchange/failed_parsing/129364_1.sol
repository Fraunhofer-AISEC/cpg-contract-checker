function shuffleArray(uint256[] memory array) {
  let curId = array.length;
  
  while (0 !== curId) {
    
    uint256 randId = randomNumber() % array.length; 
    curId -= 1;
    
    uint256 tmp = array[curId];
    array[curId] = array[randId];
    array[randId] = tmp;
  }
  return array;
}
