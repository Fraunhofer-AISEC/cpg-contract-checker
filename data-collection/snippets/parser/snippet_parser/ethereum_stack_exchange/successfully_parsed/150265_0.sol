function mintStandard() public payable whenNotPaused {
        require(
            _standardCounter.current() <= 2222,
            "Sorry we reach max supply"
        );
        require(
            balanceOf(msg.sender, STANDARD) == 0,
            "You can only own 1 Standard NFT"
        );
        require(msg.value == 0.25 ether, "insufficient balance");
        _mint(msg.sender, STANDARD, 1, "0x00");
        _standardCounter.increment();
    }
