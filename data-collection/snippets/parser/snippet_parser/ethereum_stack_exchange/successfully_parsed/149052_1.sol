
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract PurchaseTicket {
    IERC20 public constant token = IERC20(0xfd3a409a40A00E99AAbE072e304a540aa25Fd4e9);
    uint256 public constant ticketPrice = 100;
    string public constant successMessage = "Transaction successful. The following is your ticket number: 34824312.";
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function purchase() public payable returns (string memory) {
        require(token.balanceOf(msg.sender) >= ticketPrice, "Token transfer failed.");
        token.transferFrom(msg.sender, address(this), ticketPrice);
        return successMessage;
    }

    function withdrawTokens() public payable {
        require(msg.sender == owner, "Only the owner can withdraw tokens.");
        uint256 contractBalance = token.balanceOf(address(this));
        require(token.transfer(owner, contractBalance), "Token withdrawal failed.");
    }
}
