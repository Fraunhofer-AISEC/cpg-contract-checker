function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId,
    uint256 batchSize
) internal virtual override {
    super._beforeTokenTransfer(from, to, tokenId, batchSize = 1);

    
    if (!hasRole(TRANSFER_ROLE, address(0)) && from != address(0) && to != address(0)) {
        require(hasRole(TRANSFER_ROLE, from) || hasRole(TRANSFER_ROLE, to), "!TRANSFER_ROLE");
    }

    if(!coAllocatedSmartVault) {
        _setupOwner(to);
        _setupRole(DEFAULT_ADMIN_ROLE, to);
        _setupRole(MINTER_ROLE, to);
        _setupRole(TRANSFER_ROLE, to);
    }
}
