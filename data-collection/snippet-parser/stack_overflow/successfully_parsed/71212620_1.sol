
pragma solidity >=0.5.0 <6.0;

import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20, ERC20Detailed {
    string public name = "myToken";
    string public symbol = "myToken";
    uint256 public totalSupply; 

    constructor(
        string memory _name,
        string memory _symbols,
        unit8 _decimals,
        unit256 _amount
    ) public ERC20Detailed(_name, _symbols, _decimals) {
        _mint(msg.sender, _amount);
    }
}