pragma solidity ^0.4.0;

contract DataStore  {

    event Borrow(uint indexed bookId, address indexed borrower, uint timestamp);

    function borrowEvent(uint id, address borrower) {
        Borrow(id, msg.sender, now);
    }
 }
