pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

contract Token is ERC20Capped, ERC20Detailed, ERC20Burnable {

    constructor (uint256 cap)
        ERC20Detailed("Token", "TKN", 18)
        ERC20Capped(cap)
        public {
            _mint(msg.sender, 10000);
    }
}
