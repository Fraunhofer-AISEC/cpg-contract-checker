function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
    uint256 tokenCount = balanceOf(_owner);

    if (tokenCount == 0) {
        
        return new uint256[](0);
    } else {
        uint256[] memory result = new uint256[](tokenCount);
        uint256 totalCats = totalSupply();
        uint256 resultIndex = 0;

        
        
        uint256 catId;

        for (catId = 1; catId <= totalCats; catId++) {
            if (kittyIndexToOwner[catId] == _owner) {
                result[resultIndex] = catId;
                resultIndex++;
            }
        }

        return result;
    }
}
