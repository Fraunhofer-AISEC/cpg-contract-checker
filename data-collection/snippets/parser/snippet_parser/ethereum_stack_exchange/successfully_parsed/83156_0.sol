pragma solidity ^0.5.16;

contract Receive {

    function () external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract Send {

    function sendViaCall(address payable _to) public payable {

        (bool sent, bytes memory data) = _to.call.value(msg.value)("");
        require(sent, "Failed to send Ether");
    }
}
