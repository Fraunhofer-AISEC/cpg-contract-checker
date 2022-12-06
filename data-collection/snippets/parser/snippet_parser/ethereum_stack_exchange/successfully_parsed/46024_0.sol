pragma solidity ^0.4.11;

contract helloWorld {

  string public message;

  function constructor() public{
    message = "Hello World";
  }

  function sayHi() constant public returns (string){
    return message;
  }
}
