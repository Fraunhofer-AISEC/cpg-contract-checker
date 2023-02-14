pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./NFT.sol";

contract MarketPlace is ReentrancyGuard  { 
    address payable public immutable feeAccount;
    uint public immutable feePercent;
    uint public itemCount;

    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        address payable seller;
        uint price;
        bool sold;
    }

    event Offered (
        uint itemId,
        address indexed nft,
        uint tokenId,
        uint price,
        address indexed seller
    );

    event Bought (
        uint itemId,
        address indexed nft,
        uint tokenId,
        uint price,
        address indexed seller,
        address indexed buyer
    );

    mapping(uint => Item) public items;


    constructor(uint _feePercent){
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }

    function makeItem(IERC721 _nft, uint _tokenId, uint _price) external nonReentrant {
        require(_price > 0, "Price must be greater than zero");
        itemCount++;

        _nft.transferFrom(msg.sender,address(this), _tokenId);
        items[itemCount] = Item(
            itemCount,
            _nft,
            _tokenId,
            payable(msg.sender),
            _price,
            false
        );

        emit Offered(itemCount, address(_nft), _tokenId, _price, msg.sender);
        
    }

    function purchaseItem(uint _itemId) external payable nonReentrant {
        uint _totalPrice = getTotalPrice(_itemId);

        Item storage item = items[_itemId];
        require(_itemId > 0 && _itemId <= itemCount, "item doesn't exits");
        require(msg.value == _totalPrice, "not enough ether to cover the item price and market fee");
        require(!item.sold, "item already sold");

        item.seller.transfer(item.price);
        feeAccount.transfer(_totalPrice - item.price);

        item.sold = true;
        item.nft.transferFrom(address(this),msg.sender,item.tokenId);

        item.seller = payable(address(msg.sender));

        emit Bought(
            _itemId, 
            address(item.nft),
             item.tokenId,
              item.price,
               item.seller,
                msg.sender
                );

    }

    function listItemForSale(uint _itemId, uint _price) external {

        Item storage item = items[_itemId];
        require(_itemId > 0 && _itemId <= itemCount, "item doesn't exits");
        require(msg.sender == address(item.seller), "You are not the owner of this NFT!");


        

        item.sold = false;
        item.price = _price;

    }


    function getTotalPrice(uint _itemId) view public returns(uint) {
        return(items[_itemId].price * (100 + feePercent)/ 100);

    }

    function createCollection(string memory _name, string memory _tokenName) external returns(address NFT)
    {
        
        NFT newContract = new NFT(_name, _tokenName);

        return newContract;
    }
}
