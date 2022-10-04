pragma solidity ^0.4.0;

contract Test {
    struct User {
        string name;
        string surname;
        uint active;
    }

    mapping (bytes32 => User) public userRegister;

    function add_user(string _name, string _surname) {
        bytes32 _hc = sha3(_name, _surname);
        User p = userRegister[_hc];
        p.name = _name;
        p.surname = _surname;
        p.active = 1;
    }

    function remove(string _name, string _surname)  {
        bytes32 _hc = sha3(_name, _surname);
        userRegister[_hc].active = 0;
    }

    function active(string _name, string _surname)  {
        bytes32 _hc=sha3(_name, _surname);
        userRegister[_hc].active = 1;
    }

    function getUser(string _name, string _surname) constant
      returns (string name, string surname, uint256 active) {
        bytes32 _hc = sha3(_name, _surname);
        name = userRegister[_hc].name;
        surname = userRegister[_hc].surname;
        active = userRegister[_hc].active;
    }
}
