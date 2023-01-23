function loadMintIDs(uint256[MAX_TOKENS + 1] memory array)  external onlyOwner {
        require(array.length == MAX_TOKENS + 1, "List of IDs must be MAX_TOKENS + 1");
        require(!IDsLoaded, "List of IDs is already loaded.");    
        IDs = array;
        IDsLoaded = true;
    }
