pragma solidity ^0.4.18;

contract CollegeAdmin {
uint public studentAge=18;
event changedAge(uint age);
function setAge(uint age) public {
studentAge = age;
changedAge(age);
}

} 
