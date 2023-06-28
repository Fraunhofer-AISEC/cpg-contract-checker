function sendShardToShardOwner(address _shardOwner, string memory _shardURI) public onlyOwner
    {
        require(shardHolders[_shardOwner], "Not a valid Trustee");
        nftContract.distributeShard(_shardOwner, _shardURI);
    }
