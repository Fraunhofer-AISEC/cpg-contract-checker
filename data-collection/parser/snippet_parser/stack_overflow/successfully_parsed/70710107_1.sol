    function getCreator() public view returns (address) {
        return nftInfo[owner].creator;
    }

    function mint(string calldata nftName) external payable {
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        
        owner = msg.sender;
        nftInfo[msg.sender].nftId = newItemId;
        nftInfo[msg.sender].name = nftName;
        nftInfo[msg.sender].creator = msg.sender;

        allValidTokenIndex[newItemId] = allValidTokenIds.length;
        allValidTokenIds.push(newItemId);
        _tokenIds.increment();
    }
