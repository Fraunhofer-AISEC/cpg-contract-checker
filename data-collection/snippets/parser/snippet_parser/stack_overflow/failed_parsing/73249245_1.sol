function addToWhitelist(address _add) external {
    puzzleWalletAddress.delegatecall(abi.encodeWithSignature("addToWhitelist(address)", _add);)
}
