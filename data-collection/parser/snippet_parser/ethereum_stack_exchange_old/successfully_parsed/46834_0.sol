 struct Test {
   uint nmbr;
 }

 mapping(uint => Test) testMap;

 function setMap() public payable {

   testMap[1].nmbr = 4;

 }

 uint theResult = 99;

 function checkMap() public returns (uint) {

   if(testMap[1].nmbr == 4) {
       testMap[1].nmbr = 5;
       theResult = testMap[1].nmbr;
   } else if(testMap[1].nmbr == 5) {
       theResult = 34;
   }

   return theResult;
}
