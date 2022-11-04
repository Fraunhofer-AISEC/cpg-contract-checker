function tokenOfOwnerByIndex(address owner, uint256 index) public view override returns (uint256) {
    if (index >= balanceOf(owner)) revert OwnerIndexOutOfBounds();
    uint256 numMintedSoFar = totalSupply();
    uint256 tokenIdsIdx;
    address currOwnershipAddr;

    
    unchecked {
        for (uint256 i; i < numMintedSoFar; i++) {
            TokenOwnership memory ownership = _ownerships[i];
            if (ownership.addr != address(0)) {
                currOwnershipAddr = ownership.addr;
            }
            if (currOwnershipAddr == owner) {
                if (tokenIdsIdx == index) {
                    return i;
                }
                tokenIdsIdx++;
            }
        }
    }

    
    assert(false);
}
