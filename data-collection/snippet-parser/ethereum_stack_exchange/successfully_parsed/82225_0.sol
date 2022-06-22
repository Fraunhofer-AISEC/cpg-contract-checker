pragma solidity ^0.6.0;

contract HelloWord 
{
  string hello= "Hi buddy";
  function getSaluto () public view returns (string memory saluto ){
    return hello;
  }
}
