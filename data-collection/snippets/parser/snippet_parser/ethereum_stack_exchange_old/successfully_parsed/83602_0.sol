pragma solidity ^0.5.1;

contract ContractExp1{
    string public value;
    uint256 public count=0;

mapping(uint256 => Person) public people;

struct Person{
    string name;
    uint256 balance;
}


constructor() public{
    value='myValue';
}


function setPeople (string memory _name, uint256 memory _val) public {
    count=count+1;
    people[count]=Person(_name,_val);
    }
}
