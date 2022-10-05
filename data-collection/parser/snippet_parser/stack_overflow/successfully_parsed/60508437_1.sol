pragma solidity >=0.4.0 <0.6.0 ;
contract mrks {

 mapping(uint => string) public testMapping;

 function assign(uint it, string memory str) public {
   testMapping[it] = str ;
 }

 function display(uint it) returns(string) {
   return testMapping[it];
 }
}
