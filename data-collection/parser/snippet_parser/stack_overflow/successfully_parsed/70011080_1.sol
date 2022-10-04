

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

pragma solidity ^0.8.0;

contract RoboToken is ERC20, Ownable {
    uint256 public maxSupply = 100000 * 10**18;

    constructor() ERC20("Pomobots Token", "POMO") {
        _mint(msg.sender, maxSupply);
    }

    function transferToAccount(
        address to,
        uint256 amount,
        bool completedTime
    ) public onlyOwner {
        require(completedTime == true);
        _mint(to, amount);
    }

    function approveNFTContract(address _tokenAddress) public onlyOwner {
        approve(_tokenAddress, maxSupply);
    }
}

