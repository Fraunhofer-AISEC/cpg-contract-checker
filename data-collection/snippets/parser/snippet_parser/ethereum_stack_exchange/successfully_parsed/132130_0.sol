

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is KeeperCompatibleInterface, ERC721 {
    
    

    uint256 public currentDate = block.timestamp;
    uint256 public mintDate;
    uint256 public timeTillExpire;
    uint256 public expireDate = mintDate + timeTillExpire;
    uint256 public tokenId = 0;

    
    function checkUpkeep(bytes memory)
        public
        override
        returns (bool needsUpkeep, bytes memory)
    {
        bool timePassed = (expireDate >= currentDate);
        needsUpkeep = (timePassed);
    }

    
    function performUpkeep(bytes calldata) external override {
        (bool needsUpkeep, ) = checkUpkeep("");
        require(needsUpkeep == true, "Upkeep not needed.");
        _burn(tokenId);
    }

}