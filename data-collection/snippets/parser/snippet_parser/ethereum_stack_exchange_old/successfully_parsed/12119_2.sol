pragma solidity ^0.4.9;
contract Oursurance {

  address public creator;

  event LogFundsReceived(address sender, uint amount);
  event LogFundsSent(address receiver, uint amount);

  function() payable {
    LogFundsReceived(msg.sender, msg.value);
  }

  function Oursurance() payable {
    creator = msg.sender;
    LogFundsReceived(msg.sender, msg.value);
  }

  function kill() {
    selfdestruct(creator);
  }

  function send(address target, uint256 amount) {
    if (!target.send(amount)) throw;
    LogFundsSent(target, amount);
  }

}
