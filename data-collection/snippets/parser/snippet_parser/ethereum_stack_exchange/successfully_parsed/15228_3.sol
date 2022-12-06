pragma solidity ^0.4.2;

contract Relay {
address public owner;

  function Relay() {
    owner = msg.sender;
  }

  function fundRelay() payable returns (bool) {

  }

  function releaseFunds () {

  }
}
