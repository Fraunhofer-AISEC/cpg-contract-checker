

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BurnMe is ERC20, ERC20Burnable {
    constructor() ERC20("Burn me", "BURN"){}

    function mint() external {
        _mint(msg.sender, 10000);
    }
}
