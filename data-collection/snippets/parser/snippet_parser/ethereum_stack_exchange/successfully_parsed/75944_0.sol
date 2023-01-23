pragma solidity ^0.5.1;
  contract Puzzle {
     address payable public owner ;
     bool public locked ;
     uint public reward ;
     bytes32 public diff ;
     bytes public solution ;


    constructor () public {
       owner = msg.sender ;
       reward = msg.value ;
       locked = false ;
       diff = bytes32 (11111); 
    }
}