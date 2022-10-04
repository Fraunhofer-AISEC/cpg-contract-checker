pragma solidity ^0.4.18;

contract Customer {

string name;
uint age;

function setValues(string _name,uint _age) public{
    name=_name;
    age=_age;
}
function getValues() public constant returns(string,uint){
    return(name,age);
}
}
