


pragma solidity ^0.8.10;

import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

contract NFTMarket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;

    address payable owner;
    uint256 listingPrice = 0.050 ether;

    constructor() {
        owner = payable(msg.sender);
    }

    function createMarketItem(
        address nftContract, uint256 tokenId, uint256 price
    ) public payable nonReentrant {
         _itemIds.increment();
         uint256 itemId = _itemIds.current();

         IERC721(nftContract).safeTransferFrom(msg.sender, address.this, tokenId);
    }
}
