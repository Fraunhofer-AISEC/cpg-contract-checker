bool public transfersPaused = false;

function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
        require(transfersPaused = false), "transfers paused")
        safeTransferFrom(from, to, tokenId, "");
    }

function setTransfersPaused(bool _setPause) public onlyOwner {
        transfersPaused = _setPause;
    }
