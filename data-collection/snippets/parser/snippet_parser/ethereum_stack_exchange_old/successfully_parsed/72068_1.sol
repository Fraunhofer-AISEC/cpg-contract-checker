pragma solidity ^0.5.1;
contract C {          
  function pay(uint n, address payable d) public returns(bytes memory theMessage) { 
    (bool success, bytes memory returnMessage)  = d.call.value(n)("");  
    require(success, "D1 did not accept the funds."); 
    return returnMessage;  
  } 
}

contract D1 {
  uint public bal = 0;
  function() external payable { 
    bal+=msg.value; 
  }        
}
