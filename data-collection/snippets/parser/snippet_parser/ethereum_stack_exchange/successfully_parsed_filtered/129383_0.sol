
pragma solidity ^0.8.13;

contract EtherWallet{
    address payable public owner;

    constructor() {
        owner =payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(_amount);

    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
