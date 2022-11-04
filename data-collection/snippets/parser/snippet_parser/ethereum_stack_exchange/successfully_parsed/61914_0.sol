pragma solidity ^0.4.24;

contract Receive {
    uint256 public balance;
    function pay() public payable {

    }
}

contract Send {
    Receive public r;

    constructor() public {
        r = new Receive();
    }

    function send() public payable {
        address(r).transfer(msg.value);
    }
}
