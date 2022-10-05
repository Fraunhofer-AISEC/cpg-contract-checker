    function _unstakeMany(address account, uint256[] calldata tokenIds)
        internal
    {
        IERC721N nft = IERC721N(NftAddress);
        
        Stake memory staked;
        totalStaked -= tokenIds.length;
        for (uint256 i = 0; i < tokenIds.length; i++) {
            
            staked = vault[tokenIds[i]];
            uint256 timeStamp = stakeStamp(tokenIds[i]);
            require(staked.owner == msg.sender, "not an owner");
            if(block.timestamp < timeStamp + 60){
                revert timeError(timeStamp, tokenIds[i]);
            }
            delete vault[tokenIds[i]];
            emit BlockUnstaked(account, tokenIds[i], block.timestamp);
            nft.transferFrom(address(this), account, tokenIds[i]);
            
        }
    }
