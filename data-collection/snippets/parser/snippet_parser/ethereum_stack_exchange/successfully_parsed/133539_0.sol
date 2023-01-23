pragma solidity ^0.4.21; 

contract CAT {
    event XYZ (uint Z ) ;
    uint[] x;  
    uint a ;

function f(uint[]  memoryArray) public returns (uint[] ){
       x = memoryArray; 
      uint[]  y = x; 
      y.length = 2 ;       
      a = y.length ; 
      emit XYZ ( a  );
     return x ; 
  }
}

