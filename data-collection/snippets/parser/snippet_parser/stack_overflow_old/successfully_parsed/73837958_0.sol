

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

error Marketplace__PriceIsZero();

contract Marketplace is ReentrancyGuard {
    address payable public immutable feeAccount;
    uint256 public immutable feePercent;
    uint256 public itemCount;

    struct Item {
        uint256 itemId;
        uint256 tokenId;
        uint256 price;
        IERC721 nft;
        address payable seller;
        bool sold;
    }

    event ItemListed(
        uint256 itemId,
        uint256 tokenId,
        uint256 price,
        address indexed nft,
        address indexed seller
    );

    mapping(uint256 => Item) public items;

    constructor(uint256 _feePercent) {
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }

    function listItem(
        IERC721 _nft,
        uint256 _tokenId,
        uint256 _price
    ) external nonReentrant {
        if (_price <= 0) {
            revert Marketplace__PriceIsZero();
        }
        _nft.transferFrom(msg.sender, address(this), _tokenId);
        items[itemCount] = Item(
            itemCount,
            _tokenId,
            _price,
            _nft,
            payable(msg.sender),
            false
        );
        emit ItemListed(itemCount, _tokenId, _price, address(_nft), msg.sender);
    }
}
