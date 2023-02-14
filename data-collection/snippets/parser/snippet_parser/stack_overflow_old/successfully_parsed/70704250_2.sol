struct NFT {
    address collection;
    uint256 tokenID;
}

mapping (address => NFT) public userNFT;

function store(address _user, address _collection, uint256 _tokenId) external {
    userNFT[_user] = NFT(_collection, _tokenId);
}
