pragma solidity ^0.4.18;


contract Candy {
    address public owner;

    function Candy() public {
        owner = msg.sender;
    }
}
