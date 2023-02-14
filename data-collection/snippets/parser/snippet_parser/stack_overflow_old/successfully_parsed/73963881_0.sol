
pragma solidity ^0.8.0;

import "./@openzeppelin/contracts/utils/Counters.sol";
import "./@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("NFTMarketplace", "NFTM") {
        contractAddress = marketplaceAddress;
    }

    event TokenMinted (
        uint256 indexed tokenId,
        string tokenURI
    );

    function createToken(string memory tokenURI) public returns (uint) {
        uint256 currentTokenId = _tokenIds.current();
        _safeMint(msg.sender, currentTokenId);
        _setTokenURI(currentTokenId, tokenURI);
        setApprovalForAll(contractAddress, true);
        _tokenIds.increment(); 

        emit TokenMinted(currentTokenId, tokenURI);
        return currentTokenId;
    }

    function getCurrentToken() public view returns (uint256) {
        return _tokenIds.current();
    }
}

contract NFTMarketplace is ReentrancyGuard, ERC721 {

    using Counters for Counters.Counter;
    
   
    
    Counters.Counter private _itemsSold;
    
    address payable owner;
    
    uint256 listPrice = 0.01 ether;

    constructor() ERC721("NFTMarketplace", "NFTM") {}

    
    struct Token {
        uint256 tokenId;
        string tokenURI;
        address nftContract;
        string name;
        address payable owner;
        uint256 price;
        bool isListed;
    }

    
    event TokenListedSuccess (
        uint256 indexed tokenId,
        address nftContract,
        address owner,
        uint256 price,
        bool isListed
    );

    
    mapping(uint256 => Token) private idToToken;

    function updateListPrice(uint256 _listPrice) public payable {
        require(owner == msg.sender, "Only owner can update listing price");
        listPrice = _listPrice;
    }

    
    
    function listToken(address nftContract, uint256 currentTokenId, string memory tokenURI, string memory name, uint256 price) public payable {

        require(msg.value > 0, "Price must be at least 1 wei");
        require(msg.value == listPrice, "Price must be equal to listing price");

        idToToken[currentTokenId] = Token(
            currentTokenId,
            tokenURI,
            nftContract,
            name,
            payable(address(this)),
            listPrice, 
            true
        );
  
        emit TokenListedSuccess(
        currentTokenId,
        nftContract,
        msg.sender,
        listPrice, 
        true
        );
    }

    function buyNFT(address nftContract, uint256 itemId) public payable nonReentrant {
        uint price = idToToken[itemId].price;
        uint tokenId = idToToken[itemId].tokenId;
        address seller = ERC721.ownerOf(tokenId);
        address buyer = msg.sender;
        require(msg.value > 0, "You need to send some ether");
        require(buyer != seller,"You already own this nft");
        require(msg.value == price, "Please submit the asking price in order to complete the purchase");

        idToToken[itemId].isListed = false;
        idToToken[itemId].owner = payable(buyer);
        payable(seller).transfer(price);

        _itemsSold.increment();

        IERC721(nftContract).transferFrom(seller, buyer, tokenId);
    }

    
}
