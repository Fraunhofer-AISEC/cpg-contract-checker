pragma solidity ^0.4.4;


 contract T2{
 uint public k;
 event CheckVal(uint val);
 function Test() returns (uint){        
  var temp=441;
  CheckVal(temp);
  k=32; 
  return temp;
   }    
}
