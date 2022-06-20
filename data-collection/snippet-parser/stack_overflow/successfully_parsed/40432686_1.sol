pragma solidity ^0.4.4;

contract Ambrosia {

    mapping (address => bytes32) restaurants;

    address _owner;

    event Transfer(address indexed _from, address indexed _to, uint256 _value); 

    event Order(address indexed _from, address indexed _to, uint256 _value); 

    function Ambrosia() {
        _owner = msg.sender;
    }
}
