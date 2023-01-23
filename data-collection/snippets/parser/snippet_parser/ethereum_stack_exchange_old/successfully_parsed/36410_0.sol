pragma solidity ^0.4.18;

import './B.sol';

contract A {

   
   event newContractB(address contractAddress);

   function createB() returns (){
       
       address addressB = new B(); 

       
       newContractB(addressB);
   }
}
