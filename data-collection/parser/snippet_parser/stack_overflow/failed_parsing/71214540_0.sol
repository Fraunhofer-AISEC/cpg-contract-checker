

pragma solidity ^0.8.3;

import "./NFTMarket.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarketFactory is ReentrancyGuard {
    address address;
    address owner;

    constructor() {
        owner = payable(msg.sender);
    }

    .
    .
    .

    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price
      ) public payable nonReentrant {
            NFTMarket market = NFTMarket(address);
            return market.createMarketItem{value: msg.value}(address, tokenId, price, msg.sender);
      }
}
