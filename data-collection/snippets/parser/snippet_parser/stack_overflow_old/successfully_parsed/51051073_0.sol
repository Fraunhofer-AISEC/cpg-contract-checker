pragma solidity 0.4.24;

contract Lightbulb {
  enum LightState { off, on }
  address public owner;
  LightState light;
  LightState constant defaultChoice = LightState.off;
  uint public cost = 1 ether;

constructor () public {
    owner = msg.sender;
 }


modifier onlyOwner() {
    require(msg.sender == owner);
    _;
 }

function turnOn() public payable {
    require(msg.value == cost);
    light = LightState.on;
 }

function turnOff() public {
  light = LightState.off;
 }

function getState() public view returns (LightState) {
  return light;
 }

}
