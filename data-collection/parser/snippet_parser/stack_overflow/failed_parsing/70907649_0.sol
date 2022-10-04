pragma solidity ^0.8.0;
...

function sendAVAX(address payable receiver, uint256 amount) public payable {
      receiver.transfer(amount);
}
