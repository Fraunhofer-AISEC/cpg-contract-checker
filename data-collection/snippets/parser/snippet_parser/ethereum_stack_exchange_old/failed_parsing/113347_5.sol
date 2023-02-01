
uint256 allTokenCount = 100;
EnumerableSet.UintSet storage tokenIds;
for (uint256 i = 0; i < allTokenCount; i++) {
    tokenIds.add(i);
}

uint256[] memory result = new uint256[](allTokenCount);
for (uint256 i = 0; i < result.length; i++) {
    uint256 j = uint256(keccak256(abi.encode(randomNumber, i))) % tokenIds.length();
    uint256 tokenId = tokenIds.at(j);
    result[i] = tokenId;
    tokenIds.remove(tokenId);
}
return tokenIds.values()
