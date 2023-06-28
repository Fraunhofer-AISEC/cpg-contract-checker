error stakeNotOver();

 function claimReward(uint256 stakeId) external nonReentrant returns (bool){
        if(addressStaked[_msgSender()] == false)
        revert notParticipant();
        if(stakerTokensInfo[_msgSender()][stakeId].endTS > block.timestamp)
        revert stakeNotOver();
        if(stakerTokensInfo[_msgSender()][stakeId].claimed > 0)
        revert alreadyClaimed();
        for(uint256 i =0; i< stakingId[msg.sender].length; i++){
            if(stakeId != stakingId[msg.sender][i])
            revert NoSuchStakingExists();
        }
}