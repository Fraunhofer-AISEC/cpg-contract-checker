contract Test {
 
 uint lastStakeTime;
 
 function withdraw () {
  if (differenceBetween(lastStakeTime, block.timestamp, ONE_MONTH) {
     revert ("cannot withdraw before one month");
  }
  
 }

}
