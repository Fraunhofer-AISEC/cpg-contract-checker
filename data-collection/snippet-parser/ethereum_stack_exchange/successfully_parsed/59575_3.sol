pragma solidity ^0.5.2;

contract bank{
struct Person{
    uint id;
    bytes32 name;
}
mapping(address => Person) public  p;

function getDetails(address a) public view returns(uint ,bytes32){
     Person storage person = p[a];
    return(person.id , person.name);
}
function setDetails(address a,uint id , bytes32 name) public{
    Person storage person = p[a];
    person.id = id;
    person.name = name;
}
}
