function mint(string memory data) public returns(uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        bytes memory bytesData = bytes(data);

        _mint(msg.sender, newItemId, 1, bytesData);  

        setApprovalForAll(contractAddress, true); 
        return newItemId;
    }
