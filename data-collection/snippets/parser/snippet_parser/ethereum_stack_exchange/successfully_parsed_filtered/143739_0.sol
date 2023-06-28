    function safeTransferFrom(address from, address to, uint256 tokenId) public override onlyAllowedOperator(from) {
        safeTransferFrom(from, to, tokenId);
    }
