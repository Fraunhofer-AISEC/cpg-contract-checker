
pragma solidity 0.8.7;

contract BasicSolContract {
    uint256 public myVar;

    function updateVar(uint256 myNewVar) external {
        myVar = myNewVar;
    }
}

