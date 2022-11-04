
pragma solidity ^0.7.4;

contract Balek {

mapping(uint => address) public deck;

constructor() {
  deck[0] = msg.sender;
}

modifier reallySender(uint _name) {
  require(deck[_name] == msg.sender);
  _;
}

modifier onlyOwner(uint _name) {
  require(deck[0] == deck[_name]);
  _;
}

function transfer(address _to, uint _name) public reallySender(_name) {
  deck[_name] = _to;
}

function create(uint _name) public onlyOwner(_name) {
  deck[_name] = msg.sender;
}

fallback () external {
}

}
