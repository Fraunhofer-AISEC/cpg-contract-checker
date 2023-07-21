
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Sender.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Recipient.sol";
import "./ITreasury.sol";

contract SampleERC777 is ERC777, IERC777Recipient {

    constructor(
        uint256 initialSupply,
        address[] memory defaultOperators
    ) ERC777("Sample ERC777", "S777", defaultOperators) {
        _mint(msg.sender, initialSupply, "", "");
    }

    function tokensReceived(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external override {
        require(to != address(0), "SampleERC777: zero address not allowed");
        if (ITreasury(to).isTreasuryContract()) {
            ITreasury(to).deposit(operator, from, amount, userData, operatorData);
        }
    }
}
