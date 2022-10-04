pragma solidity ^0.4.8;
contract myContract  {

    address public owner;

    function myContract() {
        owner = msg.sender;
    }
}
