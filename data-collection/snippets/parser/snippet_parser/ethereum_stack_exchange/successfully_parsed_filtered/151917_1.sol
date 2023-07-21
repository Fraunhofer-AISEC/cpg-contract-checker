
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Token.sol";

contract Registry {
    Token public tokenContract;
    address public addr;
    mapping(address => address) public publicKeyToAccount;

    constructor(Token _tokenContract) {
        tokenContract = _tokenContract;
        addr = address(this);
    }

    function printBalance() external view returns (uint256) {
        return IERC20(tokenContract).balanceOf(msg.sender);
    }

    function transfer() external {
        IERC20(tokenContract).transfer(addr, 10);
    }
}
