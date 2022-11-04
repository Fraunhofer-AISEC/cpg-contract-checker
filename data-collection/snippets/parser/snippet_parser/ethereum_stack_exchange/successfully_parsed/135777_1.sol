    
    string public uri = "ipfs://<enter your cid here>"
    
    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        
        

        return uri;
    }
