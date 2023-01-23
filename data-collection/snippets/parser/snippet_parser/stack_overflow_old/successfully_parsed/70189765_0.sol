  function safeMint(address to) public onlyOwner {
        require(_tokenIdCounter.current() < totalSupply(), "There's no token to mint.");
        require(mintCnt[msg.sender] < maxMintCntPerAddress, "One address can mint 1 tickets.");

        if(mintPrice > 0) {
            require(mintPrice == msg.value, "Mint price is not correct.");
            address payable _to = payable(serviceAddress);
            _to.transfer(mintPrice);
        }

        uint randomNumber = random(expectedTokenSupply - _tokenIdCounter.current());
        for (uint256 i = 0; i < _tokenMetadata.length; i++) {
            if(_tokenMetadata[i].amount <= randomNumber) {
                _safeMint(to, _tokenIdCounter.current());
                _setTokenURI(_tokenIdCounter.current(), _tokenMetadata[i].uri);
                _tokenIdCounter.increment();
                break;
            }
        }
    }

    function random(uint maxValue) internal returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, _tokenIdCounter.current()))) % maxValue;
    }
