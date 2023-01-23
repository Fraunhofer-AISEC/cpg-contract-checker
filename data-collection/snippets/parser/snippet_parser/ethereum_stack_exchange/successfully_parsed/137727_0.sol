
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Token is ERC20 {
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply)
        ERC20(_name, _symbol)
    {
        _mint(msg.sender, _initialSupply);
    }
}
