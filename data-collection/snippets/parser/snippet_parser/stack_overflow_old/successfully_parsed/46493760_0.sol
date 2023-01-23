pragma solidity ^0.4.0;

contract Test {

    function () payable {
        msg.sender.transfer(msg.value);
    }

}
