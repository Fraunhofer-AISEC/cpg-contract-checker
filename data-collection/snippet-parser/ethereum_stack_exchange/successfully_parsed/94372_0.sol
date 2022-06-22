    function mint() public returns (uint) {
        uint newId = currentTokenId + 1;
        _mint(msg.sender, newId);
        currentTokenId = newId;
        return currentTokenId;
    }
