function getMintedAmount() public view returns (uint256) {
        return _tokenIdCounter.current();
    }
