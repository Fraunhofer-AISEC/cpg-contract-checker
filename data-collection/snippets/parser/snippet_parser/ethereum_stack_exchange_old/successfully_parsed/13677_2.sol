pragma solidity ^0.4.8;

contract Demo {
    address public user;
    uint public i = 0;

    function Demo() {
        user=msg.sender;
    }

    address[10] users;
    bytes32[10] name;

    function add(bytes32 _name) {
        users[i] = user;
        name[i] = _name;
        i++;
    }

    function get_names() constant returns(bytes32[10]) {
        return name;
    }

    function get_address() constant returns(address[10]) {
        return users;
    }
}
