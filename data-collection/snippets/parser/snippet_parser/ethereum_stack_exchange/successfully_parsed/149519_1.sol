
struct ListedToken {
    uint256 tokenId;
    address payable owner;
    address payable seller;
    uint256 price;
    bool currentlyListed;
}


event TokenListedSuccess(
    uint256 indexed tokenId,
    address owner,
    address seller,
    uint256 price,
    bool currentlyListed
);


mapping(uint256 => ListedToken) private idToListedToken;

constructor() ERC721("NFTMarketplace", "NFTM") {
    owner = payable(msg.sender);
}

function updateListPrice(uint256 _listPrice) public payable {
    require(owner == msg.sender, "Only owner can update listing price");
    listPrice = _listPrice;
}

function getListPrice() public view returns (uint256) {
    return listPrice;
}

function getLatestIdToListedToken()
    public
    view
    returns (ListedToken memory)
{
    uint256 currentTokenId = _tokenIds.current();
    return idToListedToken[currentTokenId];
}

function getListedTokenForId(
    uint256 tokenId
) public view returns (ListedToken memory) {
    return idToListedToken[tokenId];
}

function getCurrentToken() public view returns (uint256) {
    return _tokenIds.current();
}


function createToken(
    string memory tokenURI,
    uint256 price,
    uint96 feeNumerator
) public payable returns (uint) {
    
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();

    
    _safeMint(msg.sender, newTokenId);

    
    _setTokenURI(newTokenId, tokenURI);

    
    createListedToken(newTokenId, price,feeNumerator);

    return newTokenId;
}

function createListedToken(uint256 tokenId, uint256 price,uint96 feeNumerator) private {
    
    require(msg.value == listPrice, "Have to send ether equal to the listing price");
    
    require(price > 0, "Make sure the price isn't negative");

    
    idToListedToken[tokenId] = ListedToken(
        tokenId,
        payable(address(this)),
        payable(msg.sender),
        price,
        true
    );
    _setTokenRoyalty(tokenId,msg.sender,feeNumerator);

    _transfer(msg.sender, address(this), tokenId);
    
    emit TokenListedSuccess(
        tokenId,
        address(this),
        msg.sender,
        price,
        true
    );
}


function getAllNFTs() public view returns (ListedToken[] memory) {
    uint nftCount = _tokenIds.current();
    ListedToken[] memory tokens = new ListedToken[](nftCount);
    uint currentIndex = 0;
    uint currentId;
    
    
    for (uint i = 0; i < nftCount; i++) {
        currentId = i + 1;
        ListedToken storage currentItem = idToListedToken[currentId];
        tokens[currentIndex] = currentItem;
        currentIndex += 1;
    }
    
    return tokens;
}


function getMyNFTs() public view returns (ListedToken[] memory) {
    uint totalItemCount = _tokenIds.current();
    uint itemCount = 0;
    uint currentIndex = 0;
    uint currentId;
    
    for (uint i = 0; i < totalItemCount; i++) {
        if (
            idToListedToken[i + 1].owner == msg.sender ||
            idToListedToken[i + 1].seller == msg.sender
        ) {
            itemCount += 1;
        }
    }

    
    ListedToken[] memory items = new ListedToken[](itemCount);
    for (uint i = 0; i < totalItemCount; i++) {
        if (
            idToListedToken[i + 1].owner == msg.sender ||
            idToListedToken[i + 1].seller == msg.sender
        ) {
            currentId = i + 1;
            ListedToken storage currentItem = idToListedToken[currentId];
            items[currentIndex] = currentItem;
            currentIndex += 1;
        }
    }
    return items;
}

function executeSale(uint256 tokenId) public payable {
    uint price = idToListedToken[tokenId].price;
    address seller = idToListedToken[tokenId].seller;
    require(
        msg.value == price,
        "Please submit the asking price in order to complete the purchase"
    );

    
    idToListedToken[tokenId].currentlyListed = true;
    idToListedToken[tokenId].seller = payable(msg.sender);
    _itemsSold.increment();

    
    _transfer(address(this), msg.sender, tokenId);
    
    approve(address(this), tokenId);
    
    (address recipient, uint256 amount) = royaltyInfo(tokenId, price);
    
    payable(recipient).transfer(amount);
    
    payable(owner).transfer(listPrice);
    
    payable(seller).transfer(msg.value);
}




