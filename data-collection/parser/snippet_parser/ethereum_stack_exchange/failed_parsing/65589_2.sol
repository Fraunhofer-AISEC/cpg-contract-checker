function getAvailableMintsForUser(WhitelistStorage storage self) public view returns (uint256[] memory, uint8[] memory) {
    uint256 balance = self.contract.balanceOf(msg.sender);
    uint256[] memory tokenIds = new uint256[](balance);
    uint8[] memory available = new uint8[](balance);
    for(uint256 i = 0 ; i < balance ; i++) {
        tokenIds[i] = self.chroma.tokenOfOwnerByIndex(msg.sender, i);
        available[i] = calcAvailableMintsPerTokenId(self, tokenIds[i]);
    }
    return (tokenIds, available);
}
