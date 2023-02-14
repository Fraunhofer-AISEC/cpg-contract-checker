pragma solidity ^0.8;

contract MyContract {
    receive() external payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
