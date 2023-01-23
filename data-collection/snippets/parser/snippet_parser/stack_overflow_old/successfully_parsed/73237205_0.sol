
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Energy is ERC20, Ownable {
    mapping(address => bool) minters;

    constructor() ERC20("ENERGY", "NRG") {
        _mint(msg.sender, 100 * 10**decimals());
    }

    modifier isMinter() {
        require(minters[msg.sender], "Caller is not authorized to mint!");
        _;
    }

    function mintRewards(address to, uint256 amount) external isMinter {
        _mint(to, amount * 10**decimals());
    }

    function addMinter(address account) public onlyOwner {
        minters[account] = true;
    }
}
