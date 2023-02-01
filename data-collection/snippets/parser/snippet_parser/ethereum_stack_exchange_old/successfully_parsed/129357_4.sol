function setMyNumber(uint256 number) public {
   require(number <= 10, "number to high")
   if(number > 10) {
      revert NumberToHigh(number);
   }
   myNumber = number;
}
