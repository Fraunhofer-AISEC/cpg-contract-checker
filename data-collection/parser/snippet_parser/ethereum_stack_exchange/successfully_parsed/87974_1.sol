function test() public view returns (uint r) {
   uint[1] memory testArr;
   testArr[0] = 20;
   assembly {
       r := mload(testArr)
   }
}
