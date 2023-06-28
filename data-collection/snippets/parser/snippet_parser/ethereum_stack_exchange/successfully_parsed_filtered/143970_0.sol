

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Dai is ERC20 {
    constructor(uint256 initialSupply) ERC20("Dai Stablecoin", "DAI") {
        require(initialSupply > 0, "Initial supply has to be greater than 0");
        _mint(msg.sender, initialSupply * 10**18);
    }
}
