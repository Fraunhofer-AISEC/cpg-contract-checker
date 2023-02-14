pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UNITED is ERC20 {
    constructor(uint256 initialSupply) ERC20("United Token", "UNITED"){
        address payable public owner;
        _mint(msg.sender, initialSupply);
    }

}
