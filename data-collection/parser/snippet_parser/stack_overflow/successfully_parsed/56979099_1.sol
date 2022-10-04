pragma solidity ^0.5.8;

import "path-to/ERC20/ERC20.sol";
import "path-to/ERC20/ERC20Detailed.sol";

contract Token is ERC20, ERC20Detailed {
   constructor(string memory name, string memory symbol, uint8 decimals) 
    ERC20Detailed(name,symbol,decimals) 
    public {
        
    }
}
