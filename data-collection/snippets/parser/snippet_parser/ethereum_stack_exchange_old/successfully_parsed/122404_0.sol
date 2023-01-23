mapping(uint => string) public ipfsURLs;  
function mintNFT() public payable 
    {
        _tokenIds.increment();  
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        string memory tokenURI = ipfsURLs[newItemId];
        _setTokenURI(newItemId, tokenURI);
    }
