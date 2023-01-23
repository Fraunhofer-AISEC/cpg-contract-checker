pragma solidity ^0.4.17;

contract Nobody {
    function die() public {
        selfdestruct(msg.sender);
    }
}
