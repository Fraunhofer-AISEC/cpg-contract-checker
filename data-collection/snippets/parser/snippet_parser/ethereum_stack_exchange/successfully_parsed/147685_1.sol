
pragma solidity  ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTest is ERC20, Ownable {
    mapping(address => uint256) ownedTokens;
    constructor() ERC20("GuCC", "GUC") {
        uint256 initialSupply = 100*10**18;
        _mint(msg.sender, initialSupply);
    }

}
