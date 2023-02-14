
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address marketplaceContract;
    event NFTMinted(uint256 tokenId);

    constructor(address _marketplaceContract) ERC721("NFTMarketplace", "NFTM") {
        marketplaceContract = _marketplaceContract;
    }

    function mint(string memory _tokenURI) public {
        uint256 currentTokenId = _tokenIds.current();
        _tokenIds.increment(); 
        _safeMint(msg.sender, currentTokenId);
        _setTokenURI(currentTokenId, _tokenURI);
        setApprovalForAll(marketplaceContract, true);

        emit NFTMinted(currentTokenId);
    }

    function approveUser(address _user) public {
        setApprovalForAll(_user, true);
    }

    function getCurrentToken() public view returns (uint256) {
        return _tokenIds.current();
    }
}

contract NFTMarketplace is ReentrancyGuard {

    using Counters for Counters.Counter;
    Counters.Counter private _itemsSold;
    Counters.Counter private _itemsCount;
    uint256 public LISTING_FEE = 0.01 ether;
    address payable private _marketOwner;
    mapping(uint256 => Token) private _idToToken;

    constructor() {
        _marketOwner = payable(msg.sender);
    }

    
    struct Token {
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        string tokenURI;
        string name;
        uint256 price;
        bool isListed;
    }

    event TokenListed(
        address nftContract,
        uint256 tokenId,
        address seller,
        address owner,
        uint256 price
    );
    event TokenSold(
        address nftContract,
        uint256 tokenId,
        address seller,
        address owner,
        uint256 price
    );

    
    event TokenListedSuccess (
        uint256 indexed tokenId,
        address nftContract,
        address owner,
        uint256 price,
        bool isListed
    );



    
    
    function listToken(address _nftContract, uint256 _tokenId, string memory _tokenURI, string memory name) public  {

        
        
      
        IERC721(_nftContract).transferFrom(msg.sender, address(this), _tokenId);

        _idToToken[_tokenId] = Token(
            _nftContract,
            _tokenId,
            payable(msg.sender),
            payable(address(this)),
            _tokenURI,
            name,
            LISTING_FEE, 
            true
        );

        _itemsCount.increment();
        emit TokenListed(
            _nftContract,
            _tokenId,
            msg.sender,
            address(this),
            LISTING_FEE
        );
    }

    function buyNFT(address _nftContract, uint256 _tokenId) public payable nonReentrant {
        Token storage token = _idToToken[_tokenId];
        address payable buyer = payable(msg.sender);
        address payable seller = payable(token.seller);

        require(msg.value > 0, "You need to send some ether");
        require(msg.value >= token.price, "Not enough ether to cover asking price");
        
        
       IERC721(_nftContract).setApprovalForAll(buyer, true);
IERC721(_nftContract).approve(buyer, _tokenId);
        IERC721(_nftContract).transferFrom(address(this), buyer, _tokenId);
      

        payable(seller).transfer(msg.value);
        _itemsSold.increment();
        token.isListed = false;

        emit TokenSold(_nftContract, token.tokenId, address(this), msg.sender, msg.value);

        token.seller = token.owner;
        token.owner = payable(address(this));
    }

    function putUpForSale(address _nftContract, uint256 _tokenId) public payable {
        address owner = ERC721(_nftContract).ownerOf(_tokenId);
        require(msg.value > 0, "Price must be at least 1 wei");
        require(msg.value == LISTING_FEE, "Not enough ether for listing fee");
        require(owner == msg.sender, "you are not the owner of the token");
    
        IERC721(_nftContract).safeTransferFrom(owner, address(this), _tokenId);

        payable(address(this)).transfer(msg.value);
    
        Token storage token = _idToToken[_tokenId];
        token.seller = payable(msg.sender);
        token.owner = payable(address(this));
        token.isListed = true;
    
        _itemsSold.decrement();
        emit TokenListed(_nftContract, _tokenId, msg.sender, address(this), LISTING_FEE);
    }

    function getListPrice() public view returns (uint256) {
        return LISTING_FEE;
    }
    function getLatestIdToToken(uint256 _tokenId) public view returns (Token memory) {
        return _idToToken[_tokenId];
    }
    function getTokenForId(uint256 _tokenId) public view returns (Token memory) {
        return _idToToken[_tokenId];
    }

     function getOwnerOf(address _nftContract, uint256 _tokenId) public view returns(address) {
        return IERC721(_nftContract).ownerOf(_tokenId);
    }
   
    function getMarketPlaceBalance() public view returns(uint256) {
        
        return address(this).balance;
    }

    function getItemsCount() public view returns(uint256) {
        return _itemsCount.current();
    }
    function getItemsSold() public view returns(uint256) {
        return _itemsSold.current();
    }

    
    
    
}
