pragma solidity ^0.8.0;

contract Contr{
    string data;
    mapping(address => bool) public people;

    constructor(string memory _data) public {
        data = _data;
    }

    function sign(address person) public returns(bool) {
        people[person] = true;
        return people[person];
    }

    function checkSigned(address addr) public view returns(bool) {
        return people[addr];
    }

    function getData() public view returns(string memory){
        return data;
    }
}
