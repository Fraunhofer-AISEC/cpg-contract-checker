bool public transfersPaused = false;
address[] public blockedOperators;

function blockOperators(address[] calldata _blockList) public onlyOwner {
    delete blockedOperators;
    blockedOperators = _blockList;
}

function isBlocked(address _contract) public view returns (bool) {
    for (uint i = 0; i < blockedOperators.length; i++) {
        if (blockedOperators[i] == _contract) {
        return true;
        }
    }
    return false;
}

function setTransfersPaused(bool _setPause) public onlyOwner {
    transfersPaused = _setPause;
}

function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
    require(transfersPaused = false, "transfers paused");
    if (isBlocked(msg.sender) == true) {
        revert("no transfer allowed");
    }
    safeTransferFrom(from, to, tokenId, "");
}
