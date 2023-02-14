pragma solidity ^0.4.24;

contract Sender {
    uint256 public balance;

    function send(address _receiver) payable {
        msg.sender.transfer(msg.value);
    }

    function getBalance() public returns (uint) {
        return address(this).balance;
    }

}
