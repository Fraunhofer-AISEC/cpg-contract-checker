
pragma solidity ^0.8.0;

contract SendEther {

    receive() external payable {}

    function sendViaTransfer(address payable to, uint256 amount) public payable {
        to.transfer(amount);
    }
}
