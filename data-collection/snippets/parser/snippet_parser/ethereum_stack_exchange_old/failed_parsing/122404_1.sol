event MintComplete(uint tokenId, address owner);
function mintNFT() public payable
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        emit MintComplete(newItemId, msg.sender);
    }
function setURI(uint256 id, string memory ipfsURI)
        public onlyOwner 
    {
        _setTokenURI(id, ipfsURI);
    }
