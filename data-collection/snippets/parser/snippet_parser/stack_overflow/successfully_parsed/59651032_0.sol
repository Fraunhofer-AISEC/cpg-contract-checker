pragma solidity ^0.6.1;

contract payment{
    mapping(address => uint) _balance;

    fallback() payable external {
        _balance[msg.sender] += msg.value;
    }
}
