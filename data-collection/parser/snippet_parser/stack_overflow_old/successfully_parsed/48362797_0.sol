pragma solidity ^0.4.16;

contract FunctionTest {
bool public foo = true;
string public name;
uint256 public counter = 0;

function setName() public {
    
}

function writeToStorage() {
    foo = !foo;
}

function readFromStorageConstant() public constant returns (bool) {
    return foo;
}

function readFromStorageView() public view returns (bool) {
    return foo;
}
}