pragma solidity ^0.4.25;
contract MainContract {
string public variable1;

function setVariable1(string memory newValue) public {
    variable1 = newValue;
}}

contract SetContract {

MainContract myMainContract;  

constructor(
    address _myMainContract
) public {
    myMainContract = MainContract(_myMainContract);  
}

function setVariable1MainContract(string memory newValue) public {
    myMainContract.setVariable1(newValue);
}}
