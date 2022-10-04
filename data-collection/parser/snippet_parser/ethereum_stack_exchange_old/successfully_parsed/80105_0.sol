pragma solidity ^0.5.0;

contract MyContract {
    function myFunction() public pure returns(uint256 myNumber, string memory myString) {
        return (23456, "Hello!%");
    }
}
