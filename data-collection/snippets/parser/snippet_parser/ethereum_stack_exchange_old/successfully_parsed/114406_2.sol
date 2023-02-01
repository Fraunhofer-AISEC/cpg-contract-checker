

pragma solidity ^0.8.0;

contract Example {
    uint256 public stateVariable = 0;

    function modifiesInMemory() public {
        uint256 memoryCopy = stateVariable;
        memoryCopy = 10;
    }
}
