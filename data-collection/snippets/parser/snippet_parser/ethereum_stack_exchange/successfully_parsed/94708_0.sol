    function mint_dts() payable public {
        require(msg.value == 1 * (10 ** 17)); 
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        super._safeMint(tx.origin, tokenId);
    }
