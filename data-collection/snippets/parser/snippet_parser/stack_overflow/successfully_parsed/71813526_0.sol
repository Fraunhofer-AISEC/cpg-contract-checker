    uint256 public tokensPerBlock;
    mapping(address => uint256) public _balances;
    mapping(address => mapping(uint256 => uint256)) public _ownedTokens;

    function getCurrentTotalStakeEarned(address targetAddress) external view returns (uint256[] memory, uint256[] memory) {
        uint256 [] memory tokenIds = new uint256[](_balances[targetAddress]); 
        uint256 [] memory tokenRewards = new uint256[](_balances[targetAddress]); 
        for(uint256 i = 0; i < _balances[targetAddress]; i++){
            tokenIds[i] = _ownedTokens[targetAddress][i];
            tokenRewards[i] = _getTimeStaked(tokenIds[i]++).mul(tokensPerBlock);
        }
        return (tokenIds, tokenRewards);
    }

    function _getTimeStaked(uint256 tokenId) internal view returns (uint256) {
        if (receipt[tokenId].stakedFromBlock == 0) {
            return 0;
        }

        return block.number.sub(receipt[tokenId].stakedFromBlock);
    }

