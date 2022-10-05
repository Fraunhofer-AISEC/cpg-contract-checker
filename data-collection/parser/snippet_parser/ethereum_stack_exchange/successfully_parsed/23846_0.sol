pragma solidity ^0.4.11;

contract notary {
    struct individual {
        bytes32 firstname;
        bytes32 lastname;
        uint yob;
        bytes32 pancard;
        uint aadhar;
    }
    mapping(address => individual) public user;
    function Register(address _to, bytes32 _firstname, bytes32 _lastname, uint _yob, bytes32 _pancard, uint _aadhar) returns (bool success) {
        if (user[_to].aadhar != 0) {
            return false; 
        }
        user[_to].firstname = _firstname;
        user[_to].lastname = _lastname;
        user[_to].yob = _yob;
        user[_to].pancard = _pancard;
        user[_to].aadhar = _aadhar;

        return true;
    }

    function getDetails(address _to) constant returns (bytes32 _firstname, bytes32 _lastname, uint _yob, bytes32 _pancard, uint _aadhar) {
        return (user[_to].firstname, user[_to].lastname, user[_to].yob, user[_to].pancard, user[_to].aadhar);
    }
}
