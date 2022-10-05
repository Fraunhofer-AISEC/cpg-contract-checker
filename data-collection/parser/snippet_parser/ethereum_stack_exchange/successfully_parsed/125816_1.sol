
pragma solidity ^0.8.0;

contract Balance {

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
