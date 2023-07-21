function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
) internal virtual override (ERC721, ERC721Enumerable, ERC721Pausable) {
    super._beforeTokenTransfer(from, to, amount);
}
