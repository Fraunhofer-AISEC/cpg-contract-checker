pragma solidity ^0.5.11;

contract ReceiveEther {
    uint256 public count;
        function () external payable {
            require(count < 2);
                count++;
}

        function getBalance() public view returns (uint) {
            return address(this).balance;
    }
}

contract SendEtherFirst {
    address public creator= msg.sender;
        function sendViaCall (address payable _to) public payable {
            require(msg.sender == creator);
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
    }
}

contract SendEtherSecond {
        function sendViaCall (address payable _to) public payable {
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
    }
}

