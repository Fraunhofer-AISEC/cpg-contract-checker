

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BurnOther{

    ERC20Burnable _token;
    constructor(address token_){ 
        _token = ERC20Burnable(token_); 
    }

    function burnOther(uint256 amount) external {
        _token.burnFrom(msg.sender, amount);
    }
}
