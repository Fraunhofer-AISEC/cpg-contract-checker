pragma solidity ^0.4.0;

contract MyBank{

    mapping (address => uint) public balance;

    address bankManager;

    event Transfer(address _from, address _to, uint _value);

    function MyBank() {
        bankManager = msg.sender;
        balance[msg.sender] = 10000;
    }

    function transfer(address _to, uint _value) {
        if (balance[msg.sender] >= _value) {
            balance[msg.sender] -= _value;
            balance[_to] += _value;
        }
        Transfer(msg.sender, _to, _value);
    }
}
