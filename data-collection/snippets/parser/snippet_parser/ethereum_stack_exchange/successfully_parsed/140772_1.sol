pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UNITED is ERC20 {

    address payable public owner;

    constructor(uint256 initialSupply) ERC20("United Token", "UNITED"){
        _mint(msg.sender, initialSupply);
    }

}
