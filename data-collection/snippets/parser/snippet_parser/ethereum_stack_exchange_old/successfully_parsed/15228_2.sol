pragma solidity ^0.4.2;
import "./Relay.sol";

contract Node {

uint public fee;
address public owner;
address[] activeRelays;

  function Node() {
    owner = msg.sender;
    fee = 10;
  }

  function createRelay () returns (address) {
    address relay = new Relay();
    activeRelays.push(relay);
    return relay;
  }
}
