pragma solidity ^0.4.18;

contract distribution { 

event Transfer(
        address owner,
        address addresses,
        uint _value
        );

mapping(address => uint) balances;

address private owner;

function distributeBlox(address[] addresses, uint256 _value)  {
    for (uint i = 0; i < addresses.length; i++) {
        balances[owner] -= _value;
        balances[addresses[i]] += _value;
        Transfer(owner, addresses[i], _value);
        }
    }
}
