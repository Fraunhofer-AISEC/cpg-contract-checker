function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
    uint256 tokenCount = balanceOf(_owner);

    if (tokenCount == 0) {
        
        return new uint256[](0);
    } else {
        uint256[] memory result = new uint256[](tokenCount);
        uint256 totalItems = totalSupply();
        uint256 resultIndex = 0;

        uint256 itemId;

        for (itemId = 1; itemId <= totalItems; itemId++) {
            if (itemIndexToOwner[itemId] == _owner) {
                result[resultIndex] = itemId;
                resultIndex++;
            }
        }

        return result;
    }
}
