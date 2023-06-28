pragma solidity ^0.4.25;

contract Child {
   string public a;
   constructor (string arg) public payable { 
       a = arg;
   }
}

contract Factory {
    constructor () public {}
    function createChild(string arg) public payable {
        address issueContract = (new Child).value(msg.value)(arg);
    }
}
