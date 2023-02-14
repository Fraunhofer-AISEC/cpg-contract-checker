function mint(uint256 quantity_) external payable {
        require(isPublicMintEnabled, "mint is not active");
        require(totalSupply() + quantity_ < maxSupply, "exceeded max sup");
        require(
            _numberMinted(msg.sender) + quantity_ <= maxPerWallet,
            "can not mint this many"
        );
        require(msg.value >= mintPrice * quantity_,"not enought eth sent");
        _safeMint(msg.sender, quantity_);
    }
