pragma solidity ^0.5.6;

contract SaveData {
  uint public salary;

  function setSalary(uint input) public {
        salary=input;
  }

  function getSalary() public view returns(uint) {
        return salary;
  }

}
