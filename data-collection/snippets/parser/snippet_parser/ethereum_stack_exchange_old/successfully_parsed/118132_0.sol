  function addNft(address _tokenAddress, uint256 _tokenId) public {
        
        
    

        address nftOwner = IERC721(_tokenAddress).ownerOf(_tokenId);
    
        
        if (msg.sender != nftOwner) revert NotOwner(msg.sender);
    
    
        if(_tokenAddress == address(0)) revert InvalidTokenAddress(); 
    
        uint nftId = numNfts++;
    
        Nft storage n = nftMapping[nftId];
        n.id = nftId; 
        n.tokenAddress = _tokenAddress;
        n.tokenId = _tokenId;
        n.timeStamp = block.timestamp;
        
        
        ownerToNftIndices[msg.sender].push(nftId);
    
        emit NewNftAdded(_tokenAddress, _tokenId, msg.sender, block.timestamp);
    
    }
