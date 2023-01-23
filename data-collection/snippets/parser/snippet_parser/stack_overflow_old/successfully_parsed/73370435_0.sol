pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Version1 is ERC20, Ownable {
    address version2;

    modifier onlyVersion2 {
        require(msg.sender == version2);
        _;
    }

    constructor() ERC20("Version 1", "v1") {
        _mint(msg.sender, 1000);
    }

    function setVersion2Address(address _version2) external onlyOwner {
        version2 = _version2;
    }

    function version2Burn(address from, uint256 amount) external onlyVersion2 {
        _burn(from, amount);
    }
}

contract Version2 is ERC20 {
    Version1 version1;

    constructor(Version1 _version1) ERC20("Version 2", "v2") {
        version1 = _version1;
    }

    function burnToMint(uint256 amount) external {
        version1.version2Burn(msg.sender, amount);
        _mint(msg.sender, amount);
    }
}
