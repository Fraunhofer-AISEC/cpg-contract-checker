    function claim(uint256 pid, uint256 cAmount, address test) external nonReentrant returns (bool){
        return _claim(pid, cAmount, test);
    }

    function _claim(uint256 pid, uint256 cAmount, address test) internal returns (bool){
        require(test == msg.sender, "ERROR");
        bool success;
        uint256 possibleClaim = _getClaimableAmount(pid, test);
        require(possibleClaim >= cAmount, "Claim: Not enough claimable amount");
        _reflow(pid);
        uint256 tempDaoFee = cAmount.mul(_poolInfo[pid].claimFee);
        uint256 daoFee = tempDaoFee.div(100);
        success = IERC20(_poolInfo[pid].poolT.rewardToken).transfer(test, cAmount.sub(daoFee));
        _poolInfo[pid].poolT.rewardToken.transfer(_poolInfo[pid].daoWallet, daoFee);
        return success;
    }

