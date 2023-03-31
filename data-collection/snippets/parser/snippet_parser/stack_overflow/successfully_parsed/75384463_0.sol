
mapping(address => mapping(uint256 => uint256)) public _balances;


mapping(address => uint256[]) public _tokenIds;


mapping(uint256 => uint256) public _tokenPrice;

address[] public _ownerAddresses;

function migrateData(address _oldContract) public payable {
        NFTMinter oldContract = NFTMinter(_oldContract);
        address[] memory allAddresses = oldContract.getAllAddresses();
        for (uint i = 0; i < allAddresses.length; i++) {
            address holder = allAddresses[i];
            _ownerAddresses.push(holder);
            uint256[] memory tokenIds = oldContract.getTokenIdsByAddress(holder);
            for (uint j = 0; j < tokenIds.length; j++) {
                uint256 tokenId = tokenIds[j];
                _balances[holder][tokenId] += oldContract.getBalanceOf(holder, tokenId);
                _tokenIds[holder] = oldContract.getTokenIdsByAddress(holder);
                _tokenPrice[tokenId] = oldContract.getTokenPrice(tokenId);
            }
        }
    }
