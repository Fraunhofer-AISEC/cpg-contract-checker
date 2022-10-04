function getMyNumber() public view returns (uint256) {
   if(myNumber == 0) {
      revert NumberNotSet(myNumber);
   }
   return myNumber
}
