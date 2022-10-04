function bulkMint(string[] memory uris)
        public
        onlyOwner
    {
        _allTokenURIs = uris;
        address to = msg.sender;
        for (uint256 i = 0; i < _allTokenURIs.length; i++) {
            string memory uri = _allTokenURIs[i];
            safeMint(to, uri);
        }
    }
