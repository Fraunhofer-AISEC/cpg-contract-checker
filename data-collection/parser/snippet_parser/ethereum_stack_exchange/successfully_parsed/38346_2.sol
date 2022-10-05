pragma solidity ^0.4.18;
import 'zeppelin-solidity/contracts/ownership/Heritable.sol';
contract DormantAsset  is Heritable {
  event Sent(address indexed payee, uint256 amount, uint256 balance);
  event Received(address indexed payer, uint256 amount, uint256 balance);
  function DormantAsset(uint256 _heartbeatTimeout) Heritable(_heartbeatTimeout) public {}
  function () public payable {
    Received(msg.sender, msg.value, this.balance);
  }
  function sendTo(address payee, uint256 amount) public onlyOwner {
    require(payee != 0 && payee != address(this));
    require(amount > 0);
    payee.transfer(amount);
    Sent(payee, amount, this.balance);
  }
}