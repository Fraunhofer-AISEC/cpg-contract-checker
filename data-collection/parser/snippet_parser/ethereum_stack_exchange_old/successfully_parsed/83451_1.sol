pragma solidity ^0.5.11;

contract ReceiveEther {
uint256 public count;
address public owner= address(this);

function () external payable {
    require(count < 2);
    count++;
}

function getBalance() public view returns (uint) {
    return address(this).balance;
    }
}

contract SendEtherFirst {
    address owner;
    function sendViaCall (address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call.value(msg.value)("");
       require(msg.sender == owner);
        require (sent, "failed to send ether");
    }
}

  contract SendEtherSecond {
    function sendViaCall (address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call.value(msg.value)("");
        require (sent, "failed to send ether");
    }
}
