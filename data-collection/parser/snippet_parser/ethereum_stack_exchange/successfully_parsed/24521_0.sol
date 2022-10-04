contract testContract {

   uint256 test;

   function testContract() {    
   }

   function getTest() constant returns (uint256) {
       return test;    
   }

   function setTest(uint256 _test) {
       test = _test;    
   } 
}
