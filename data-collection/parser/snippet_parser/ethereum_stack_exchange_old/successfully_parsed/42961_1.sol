pragma solidity ^0.4.20;

contract Checker {

    mapping (address => bytes32) members; 
    mapping (bytes32 => bool) isTaken;

    function isMember(address member) public view returns(bool isIndeed) {
        return (members[member] != 0);
    }

    function isSet(bytes32 name) public view returns(bool isIndeed) {
        return (isTaken[name]);
    }

    function register(bytes32 _name) public returns(bool success){
        require(members[msg.sender] == "");
        require(!isSet(_name));
        members[msg.sender] = _name;
        isTaken[_name] = true;
        return true;
    }

}
