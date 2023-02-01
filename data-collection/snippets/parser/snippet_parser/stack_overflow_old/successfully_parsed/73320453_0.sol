    uint256 public constant TOTAL_SUPPLY = 100;
    uint256 public constant MINT_PRICE = 0.02 ether;
    uint256 public constant MAX_PUBLIC_MINT = 10;

    function mintTo(address recipient, uint256 count) public payable {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        require(
            count > 0 && count <= MAX_PUBLIC_MINT,
            "Max mint supply reached"
        );

        require(
            msg.value == MINT_PRICE * count,
            "Transaction value did not equal the mint price"
        );

        for (uint256 i = 0; i < count; i++) {
            currentTokenId.increment();
            uint256 newItemId = currentTokenId.current();
            _safeMint(recipient, newItemId);
        }

        bool success = false;
        (success, ) = owner().call{value: msg.value}("");
        require(success, "Failed to send to owner");
    }
