    
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/ERC20Burnable.sol";

contract MYCOIN is ERC20, ERC20Burnable {
    constructor() ERC20("MYCOIN", "MAT") {
        _mint(msg.sender, 210000000000000000 * 10 ** decimals());
    }
}
