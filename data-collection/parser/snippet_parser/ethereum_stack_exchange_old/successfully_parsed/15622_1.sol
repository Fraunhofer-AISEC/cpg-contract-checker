pragma solidity ^0.4.4;
import "./Relay.sol";
import "./MetaCoin.sol";

contract Node is MetaCoin {

uint public fee;
address public owner;
address[] public publicRelays;

  function Node() {
    owner = msg.sender;
    fee = 10;
  }

  function createRelay () returns (address){
    address relay = new Relay();
    publicRelays.push(relay);
    return relay;
  }
}
