$ less Greeter.sol pragma solidity ^0.4.2;

contract mortal {    address owner;   function mortal() { owner = msg.sender; }

  function kill() {  if (msg.sender == owner) suicide(owner);  } } Greeter.sol (END)
