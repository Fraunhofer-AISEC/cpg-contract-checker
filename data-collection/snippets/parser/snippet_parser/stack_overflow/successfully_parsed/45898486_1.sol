pragma solidity ^0.4.4;

contract B {
    address public owner;
    string public name;

    function B(address _owner, string _name) {
        owner = _owner;
        name = _name;
    }
}
