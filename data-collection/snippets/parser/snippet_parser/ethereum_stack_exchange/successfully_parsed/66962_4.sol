pragma solidity ^0.4.24;

interface myInterface {

function registerUser(string email) external
      returns (bool success);
}

contract myContract is myInterface {
    function registerUser(string  email) external
      returns (bool success){
         
      }
    }
