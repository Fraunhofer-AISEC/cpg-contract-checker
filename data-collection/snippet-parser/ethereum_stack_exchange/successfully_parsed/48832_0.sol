pragma solidity ^0.4.20;

contract partOne {
    address public owner;
    function partOne() public {
        owner = msg.sender;
    }
}

contract partTwo is partOne{
    uint public ownerBalance;
    function partTwo() public {
        ownerBalance = 500;
    }
}
