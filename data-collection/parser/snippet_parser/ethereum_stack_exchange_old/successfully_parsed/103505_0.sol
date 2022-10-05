
pragma solidity ^0.5.3;

contract Cont {

  address[] players;
  uint test = 123;

function enter() public payable { 
    require(msg.value > .01 ether, "Sender don't have enogth ether");
    players.push(msg.sender);
  }

function getTest() public view returns (uint) { 
    return test;
  }
}
