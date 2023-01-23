pragma solidity ^0.5.1;

contract MKotET1_1{

    address payable king; uint public claimPrice = 100;

    function calculateCompensation() public returns(uint) {
    }

    function( ) external payable {
       if (msg.value  < claimPrice) revert();
           uint compensation = calculateCompensation();
           if(!king.call.value(compensation)("")) revert();
          king = msg.sender;
       }
    }
