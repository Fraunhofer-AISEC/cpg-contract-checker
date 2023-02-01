function mint(address _recipient, uint256 _tokenId, uint256 _amount) public payable {

        if(whitelistedAddresses[msg.sender] == 0) {
            require(mintEnabled, "Minting has not been enabled.");
            require(msg.value == _amount * mintPrice, "Incorrect mint value.");
        } else {
            require(whitelistGiveaway, "Whitelist giveaway has not been enabled");
            require(isValid(_tokenId) == true, "Whitelist giveaway is no longer valid.");
            whitelistedAddresses[msg.sender] -= _amount;
        }

        require(_amount >= 1, "please enter a valid number");
        require(totalSupply[_tokenId] + _amount <= maxSupply, "Sorry, you have exceeded the supply.");
        require(tokenIdMints[msg.sender][_tokenId] + _amount <= maxPerTokenId, "Sorry, you have exceeded the alotted amount per token ID.");

        totalSupply[_tokenId] += _amount;
        tokenIdMints[msg.sender][_tokenId] += _amount;
        _mint(_recipient, _tokenId, _amount, "");
        
    }
