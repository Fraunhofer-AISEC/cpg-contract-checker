
pragma solidity ^0.8.0;

import "./ERC777P.sol";
import "./MinterRole.sol";

contract TokenMBP is ERC777P, MinterRole {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply
    ) ERC777P(name, symbol, defaultOperators)
    {
        _mint(msg.sender, initialSupply, "", "", "");
    }

    function mint(address account, uint256 amount, bytes memory userData, bytes memory operatorData, bytes32 proof) public onlyMinter returns (bool) {
        _mint(account, amount, userData, operatorData, proof);
        return true;
    }

    function burn(uint256 amount, bytes memory userData, bytes memory operatorData) public returns (bool) {
        _burn(msg.sender, amount, userData, operatorData);
        return true;
    }
}
