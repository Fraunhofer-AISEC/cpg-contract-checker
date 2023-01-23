function getTokenBalance(address _contractAddr, uint256 _tokenId) view public returns (uint256) {
    ERC1155 token = ERC1155(_contractAddr);
    return token.balanceOf(msg.sender, _tokenId);
}
