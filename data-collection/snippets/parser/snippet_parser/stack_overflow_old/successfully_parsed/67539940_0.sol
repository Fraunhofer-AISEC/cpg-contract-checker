function vaultSize(uint256 vaultId) public view virtual returns (uint256) {
    return
        store.isD2Vault(vaultId)
            ? store.d2Holdings(vaultId)
            : store.holdingsLength(vaultId).add(
                store.reservesLength(vaultId)
            );
}
