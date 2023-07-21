

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    address public marketingWallet;
    address public devWallet;

    constructor(address _marketingWallet, address _devWallet) ERC20("My Token", "MYT") {
        require(_marketingWallet != address(0) && _devWallet != address(0), "Invalid wallet addresses");

        marketingWallet = _marketingWallet;
        devWallet = _devWallet;

        uint256 totalSupply = 15 * 10**9 * 10**18; 
        uint256 devTokens = (totalSupply * 5) / 100; 
        uint256 marketingTokens = (totalSupply * 5) / 100; 

        _mint(devWallet, devTokens);
        _mint(marketingWallet, marketingTokens);
        _mint(msg.sender, totalSupply - devTokens - marketingTokens);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        

        super._transfer(sender, recipient, amount);
    }
}
