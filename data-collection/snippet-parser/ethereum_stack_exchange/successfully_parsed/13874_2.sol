pragma solidity ^0.4.4;
contract delegateReceiever{
uint public testInt;

function delegateReceiever(){
    testInt = 2;
}

function setTestInt(uint _testInt){
    testInt = _testInt;
}
}
