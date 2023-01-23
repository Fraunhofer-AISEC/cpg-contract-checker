pragma solidity ^0.5.1;

contract MKotET1_12{

    address payable king; uint public claimPrice = 100;

    function calculateCompensation() public returns(uint) {}

    function() external payable {
        if (msg.value  < claimPrice) revert();
            uint compensation = calculateCompensation();
            (bool success, ) = king.call.value(compensation)("");
            require(success);
            king = msg.sender;
        }
    }
