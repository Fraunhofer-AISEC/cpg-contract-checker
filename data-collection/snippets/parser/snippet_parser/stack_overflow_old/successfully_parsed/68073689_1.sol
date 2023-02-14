pragma solidity ^0.8.5;

contract HelloWorld {
  string private helloMessage = "Hello world";

  function getHelloMessage() public view returns (string){
    return helloMessage;
  }
}
