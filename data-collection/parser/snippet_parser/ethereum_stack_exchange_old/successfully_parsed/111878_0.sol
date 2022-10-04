function balanceOf(address collectionAddress) external view returns(uint256) {
    return MyERC721(collectionAddress).balanceOf(msg.sender);
}
