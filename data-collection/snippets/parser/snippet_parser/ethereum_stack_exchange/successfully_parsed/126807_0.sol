    struct NFTListings {
        uint256 id;
        address nftAddress;
        uint256 tokenId;
        uint256 price;
        string  nftName;
        string  nftImage;
        string  nftDescription;
        address listingTokenAddress;
        string listingTokenName;
        string listingTokenSymbol;
        address seller;
        uint256 expiration;
        bool isListed; 
        bool isSold;
    }

    
    
    NFTListings[]  private  listings;
    
       
    function initialize( )
        external
        initializer
    {
        __Ownable_init();
        __ReentrancyGuard_init();
    }
    

    
    function _createListing(
    address _nftAddress,
    uint256 _tokenId,
    string memory _nftName,
    string memory _image,
    string memory _description,
    address _listingTokenAddress, 
    string memory _listingTokenName, 
    string memory _listingTokenSymbol,
    uint256 price,
    uint256 expiration
) internal {
    require(_nftAddress != address(0), "zero address");
    require(price > 0, "zero amount");

     uint256 _id = listings.length;
    NFTListings memory _NftListing = NFTListings(
        _id, 
        _nftAddress,
        _tokenId,
        price,
        _nftName,
        _image,
        _description,
        _listingTokenAddress,
        _listingTokenName,
        _listingTokenSymbol,
        msg.sender,
        expiration,
        true,
        false
    );
    listings.push(_NftListing);
   }
    function delist(
        uint256 _NftId, 
         address _nftAddress,
        uint256 _tokenId,
        string memory _nftName,
        string memory _image,
        string memory _description
        ) external {
        
        listings[_NftId].isListed = false; 
        emit Delisted(_NftId, _nftAddress, _tokenId, _nftName, _image,            _description);
    }
