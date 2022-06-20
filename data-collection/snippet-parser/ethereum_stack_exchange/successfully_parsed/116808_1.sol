     function atokensByOwnerAAAA(address _owner) external view returns(uint256) {
        uint256 tokenCount = balanceOf(_owner);
            uint256 index;
            uint256 count;
            for (index = 0; index < tokenCount && index < RANGE_MAX_TOKEN_FOR_FREE_MINT; index++) {
                if (index >= RANGE_MIN_TOKEN_FOR_FREE_MINT) {
                    count++;
                }
                if (index > RANGE_MAX_TOKEN_FOR_FREE_MINT) {
                
                break;
                }
            } 
        return count;
        }

   function atokensByOwnerBBBB(address _owner) external view returns(uint256) {
        uint256 tokenCount = balanceOf(_owner);
            uint256 index;
            uint256 count;
            for (index = 0; index < tokenCount && index < RANGE_MAX_TOKEN_FOR_FREE_MINT; index++) {
                
                    count++;
                
                if (index > RANGE_MAX_TOKEN_FOR_FREE_MINT) {
                
                break;
                }
            } 
        return count;
        }

    function atokensByOwnerCCCC(address _owner) external view returns(uint256) {
        uint256 tokenCount = balanceOf(_owner);
            uint256 index;
            uint256 count;
            for (index = 0; index < tokenCount && index <= RANGE_MAX_TOKEN_FOR_FREE_MINT; index++) {
                if (index >= RANGE_MIN_TOKEN_FOR_FREE_MINT) {
                    count++;
                }
            } 
        return count;
        }
