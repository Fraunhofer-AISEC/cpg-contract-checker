pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";    
contract Coins is ERC20 {
        constructor(string memory name_, string memory symbol_)  ERC20(name_, symbol_) {
            _mint(msg.sender, 1000000000000000000000);
        }
    }
