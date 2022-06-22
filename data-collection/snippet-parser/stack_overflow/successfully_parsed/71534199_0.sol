    
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Faucet.sol";

contract Anne is ERC20, Ownable, Faucet {
    
    uint256 private _maxSupply = 18_000_000 * 10**decimals();

    constructor(uint256 totalSupply)
        ERC20("ANNE", "ANNE")
        Faucet(500_000 * 10**decimals())
    {
        _mint(msg.sender, totalSupply * 10**decimals());
    }

    
    function getMaxSupply() public view returns (uint256) {
        return _maxSupply;
    }

    function drip(address account) public {
        _drip(account);
    }

    
    function mint(address account, uint256 amount) public onlyOwner {
        require(
            totalSupply() + amount <= getMaxSupply(),
            "Max Supply Exceeded"
        );
        _mint(account, amount);
    }
}
