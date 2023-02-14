
pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

contract CustomToken is ERC20Pausable, ERC20Burnable, ERC20Mintable, ERC20Detailed {

    constructor () public ERC20Detailed("CustomToken", "CT", 2) { }

    

}

