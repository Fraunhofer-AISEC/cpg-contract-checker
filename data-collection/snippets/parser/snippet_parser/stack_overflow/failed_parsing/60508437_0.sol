pragma solidity >=0.4.0 <0.6.0 ;
contract mrks
{
 mapping(uint => string) public var ;

 function assign(uint it, string memory str) public
 {
   var[it] = str ;
 }

 function display(uint it) returns(uint) 
 {
   return var[it] ;
 }
}
