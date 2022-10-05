pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tokenis ERC20 {
    address public admin;
    address public liquidator;
    
    constructor() ERC20("Token", "TKN", 10000000000000000000000000000) public {
        admin = msg.sender;
    }

    function setLiquidator(address _liquidator) external {
        require(msg.sender == admin, "only admin");
        liquidator = _liquidator;
    } 

    function mint(address to, uint amount) external {
        require(msg.sender == liquidator, "only liquidator");
        _mint(to, amount);
    }
    
}
