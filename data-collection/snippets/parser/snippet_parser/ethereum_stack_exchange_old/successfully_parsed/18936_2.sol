    pragma solidity ^0.4.6;

    contract Child {

      address public owner; 

      function Child() {
        owner = msg.sender;
      }
    }
