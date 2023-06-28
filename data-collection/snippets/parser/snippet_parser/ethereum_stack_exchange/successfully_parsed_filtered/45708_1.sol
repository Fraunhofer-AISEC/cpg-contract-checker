pragma solidity ^0.4.21;

contract Sharer {
    function sendHalf() public payable {
        require(msg.value % 2 == 0, "Even value required.");
    }
}
