pragma solidity ^0.4.24;


contract MyContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function() external payable {
        owner.transfer(msg.value); 
    }

}
