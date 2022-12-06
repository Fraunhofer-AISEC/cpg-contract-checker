pragma solidity ^0.4.16;
contract HoneyPot {
  mapping (address => uint) public balances;
  function HoneyPot() payable {
    put();
  }
  function put() payable {
    balances[msg.sender] = msg.value;
  }
  function get() {
    if (!msg.sender.call.value(balances[msg.sender])()) {
      revert();
    }
      balances[msg.sender] = 0;
  }
  function() {
    revert();
  }
}
