mapping( uint256 => ObjectDetails) private attributes;


struct ObjectDetails {
    uint dailyClaim;
    uint lastClaimDate;
}


function getTimeUntilRewrdClaimable(uint256 tokenId) public view returns (int) {
    return int(attributes[tokenId].lastClaimDate + 60 - block.timestamp);
}
