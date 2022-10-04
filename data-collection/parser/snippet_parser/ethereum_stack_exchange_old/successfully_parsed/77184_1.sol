pragma solidity ^0.5.12;

contract TestContract {
    int public globalNumber;

    
    function addToGlobalVar(int num) public returns (int){
        globalNumber += num;
        return globalNumber;
    }
}
