 function ownerOfTokenIds(address tokenOwner) external view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](balanceOf(tokenOwner));
        uint256 counter = 0;
        for (uint256 i = 0; i < tokenCounter; i++) {
            if (ownerOf(i) == tokenOwner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
