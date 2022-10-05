pragma solidity ^0.4.8;
contract Trial {
   address public owner;
   address public person;
   uint initialEther;
   function Trial(address _person) payable {
       owner = msg.sender;
       person = _person;
       initialEther = msg.value;
   }
   modifier only_person() {
       if (msg.sender!=person && tx.origin!=person) throw;
       _;
   }


   function() payable {}  

   bytes4 public signature = bytes4(sha3("libraryFunction()"));
   bool variableToBeChanged = false;
   function libraryInvocation(address libraryAddress) only_person {
       bool doSomething = libraryAddress.delegatecall(signature);
       if (variableToBeChanged) {
           .....
      }
   }
}
