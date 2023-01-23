mapping (address => mapping (address => uint256)) public userCollectionToken;

function store(address _user, address _collection, uint256 _tokenId) external {
    userCollectionToken[_user][_collection] = _tokenId;
}
