pragma solidity ^0.8.0;

contract counterContract {
    uint256 public tokenCounter;

    function setCounter() public {
        unchecked {
            tokenCounter += 1;
        }
    }
}

