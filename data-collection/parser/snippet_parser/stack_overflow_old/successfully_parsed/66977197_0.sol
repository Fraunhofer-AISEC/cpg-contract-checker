

pragma solidity 0.8.1;

contract PropertyV2 {
    uint public value;
    string public location;
    

constructor(uint _value, string _location) public {
    value = _value;
    location = _location;
}

function setValue(uint _value) public {
    value = _value;
}

function getLocation() public view returns(string) {
    return location;
}}
