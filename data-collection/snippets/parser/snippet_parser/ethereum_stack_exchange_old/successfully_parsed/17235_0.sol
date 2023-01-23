pragma solidity 0.4;

contract account {
  address blocker;
  address user;
  bool isBlocked;
  function account(address blockerAccount, address _user) {
    blocker=blockerAccount;
    user=_user;
    isBlocked=true;
  }
  modifier isUnblocked() {
    if(!isBlocked) {
        _;
    }
  }
  modifier isBlocker(address msgSender) {
    if(msgSender == blocker) {
        _;
    }
  }
  modifier isUser(address msgSender) {
    if(msgSender == user) {
        _;
    }
  }
  function unblock() isBlocker(msg.sender) {
    isBlocked=false;
  }
  function withdraw(address withdrawAddress, uint amount) isUser(msg.sender) isUnblocked() {
    withdrawAddress.transfer(amount);
  }
}
