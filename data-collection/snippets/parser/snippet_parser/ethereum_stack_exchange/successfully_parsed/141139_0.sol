pragma solidity ^0.4.17;

contract Loaner {
    address public lender;
    address public borrower;
    
    function Lottery() public {}

    function setLender() public {
        lender = msg.sender;
    }

    function setBorrower() public {
        borrower = msg.sender;
    }
}
