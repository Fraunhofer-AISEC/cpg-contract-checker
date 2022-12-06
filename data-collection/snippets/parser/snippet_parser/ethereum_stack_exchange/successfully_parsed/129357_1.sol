function setMyNumber(uint256 number) public {
   if(number > 10) {
      revert NumberToHigh(number);
   }
   myNumber = number;
}
