pragma solidity ^0.4.4;

contract A {

    address public owner; 

    function A() {
        owner = msg.sender;
    }

    function createB(string name) returns(address deployed) {
        return new B(msg.sender, name);
    }
}

pragma solidity ^0.4.4;

contract B {

    address public owner;
    string public name;

    function B(address _owner, string _name) {
        owner = _owner;
        name = _name;
    }
}
