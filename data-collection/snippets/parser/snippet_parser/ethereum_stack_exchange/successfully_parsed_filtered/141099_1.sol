
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarketplace is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs; 
    Counters.Counter private _itemsSold; 

    uint256 listingPrice = 0.001 ether; 
    address payable owner; 

    constructor() ERC721("Metaverse Tokens", "META") {
        owner == payable(msg.sender);
    }

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => MarketItem) private idToMarketItem;

    event MarketItemCreated (uint256 indexed tokenId, address seller, address owner, uint256 price, bool sold);
        
    
    function getListingPrice() public view returns(uint256) {
        return listingPrice;
    }

    
    function updatedListingPrice(uint _listingPrice) public payable{
        require(owner == msg.sender, "You are not the owner!");
        listingPrice = _listingPrice;
    }

    
    function createToken(string memory tokenURI, uint256 price) public payable returns(uint) {
        _tokenIDs.increment();
        uint256 newTokenId = _tokenIDs.current();
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        createMarketItem(newTokenId, price);
        return newTokenId;
    }
}
