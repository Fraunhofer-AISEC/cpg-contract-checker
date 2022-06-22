    function tokensByOwnerForFreeMint(address _owner) external view returns(uint256) {
        uint256 tokenCount = balanceOf(_owner);
            uint256 index;
            uint256 indextwo;
            uint256 count;
            for (index = 0; index < tokenCount; index++) {
                indextwo = tokenOfOwnerByIndex(_owner, index);
                if (indextwo >= RANGE_MIN_TOKEN_FOR_FREE_MINT && indextwo <= RANGE_MAX_TOKEN_FOR_FREE_MINT) {
                    count++;
                }
            }
            return count;
        }
