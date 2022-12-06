    function gift(address _account) external onlyOwner {
        if (totalSupply() + 1 > MAX_SUPPLY) {
            revert LPR__MintGiftExceeded();
        }

        _safeMint(_account, (s_nftIdCounter).current());
        (s_nftIdCounter).increment();
    }
