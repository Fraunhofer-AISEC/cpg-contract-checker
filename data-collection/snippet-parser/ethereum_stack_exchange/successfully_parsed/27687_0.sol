    pragma solidity ^0.4.9;

    contract Contract {

      address public creator;


      event Log(uint256 id);


      function Contract() {
        creator = msg.sender;
      }

      function kill() {
        selfdestruct(creator);
      }

      function add(uint256 id) {
        Log(id);
    }
   }
