function generateNFTMusic(address to) 
        public 
        payable
        returns (uint256)
    { 
        require(msg.value >= 0.01 ether, "Not enough ETH sent: check price.");

        
        _tokenIdCounter.increment();
        uint256 newSampleId = _tokenIdCounter.current();

        _safeMint(to, newSampleId);
        _setTokenURI(newSampleId, tokenURI_);   
        return newSampleId;         
       
    }
