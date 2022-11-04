pragma solidity ^0.5.12;

contract C{
   bytes public name;
   function rep(bytes memory pseudonym)  public returns(string memory){
       name=pseudonym;
       return string(name);
   }
   }
