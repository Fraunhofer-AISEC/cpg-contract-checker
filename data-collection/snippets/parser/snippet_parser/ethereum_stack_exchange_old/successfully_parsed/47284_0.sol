pragma solidity ^0.4.18;

contract distribution { 

mapping(address => uint) balances;

address private owner;

function distributeBlox(address[] addresses, uint256 _value) owner {
    for (uint i = 0; i < addresses.length; i++) {
        balances[owner] -= _value;
        balances[addresses[i]] += _value;
        Transfer(owner, addresses[i], _value);
    }
  }
}
