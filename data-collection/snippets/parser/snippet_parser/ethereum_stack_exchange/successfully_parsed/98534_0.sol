
    function deposit(uint256 _pid, uint256 _amount) public nonReentrant  poolExists(_pid) {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        updatePool(_pid);
        if (user.amount > 0) {
            uint256 pending = user.amount.mul(pool.accBlzdPerShare).div(1e12).sub(user.rewardDebt);
            if (pending > 0) {
                safeBlzdTransfer(msg.sender, pending);
            }
        }
        if (_amount > 0) {
            pool.lpToken.safeTransferFrom(address(msg.sender), address(this), _amount);
            if (pool.depositFeeBP > 0) {
                uint256 depositFee = _amount.mul(pool.depositFeeBP).div(10000);
                uint256 depositeFeeHalf = depositFee.div(2);
                pool.lpToken.safeTransfer(feeAddBb, depositeFeeHalf);
                pool.lpToken.safeTransfer(feeAddSt, depositeFeeHalf);
                user.amount = user.amount.add(_amount).sub(depositFee);
            } else {
                user.amount = user.amount.add(_amount);
            }
        }
        user.rewardDebt = user.amount.mul(pool.accBlzdPerShare).div(1e12);
        emit Deposit(msg.sender, _pid, _amount);
    }
