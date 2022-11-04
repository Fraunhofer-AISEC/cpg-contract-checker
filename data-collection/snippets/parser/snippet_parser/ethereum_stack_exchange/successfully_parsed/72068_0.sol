pragma solidity ^0.5.1;
contract C {          
  function pay(uint n, address payable d)public { 
    d.send(n);  
  } 
}

contract D1 {
  uint public bal = 0;
  function() external { 
    bal+n; 
  }        
}
