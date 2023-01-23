
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Test Token", "TET") {
        _mint(msg.sender, initialSupply * (10**decimals()));
    }

    function claimFreeToken() public payable {
        transfer(msg.sender, 1000 * (10**decimals()));
    }
}
