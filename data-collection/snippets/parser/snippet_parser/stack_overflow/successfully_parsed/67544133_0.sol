
function withdraw(uint256 _pid, uint256 _amount) public {
    PoolInfo storage pool = poolInfo[_pid];
    UserInfo storage user = userInfo[_pid][msg.sender];
    require(user.amount >= _amount, "withdraw: not good");
    updatePool(_pid);
    uint256 pending = user.amount.mul(pool.accSushiPerShare).div(1e12).sub(user.rewardDebt);
    if(pending > 0) {
        safeSushiTransfer(msg.sender, pending);
    }
    if(_amount > 0) {
        user.amount = user.amount.sub(_amount);

        
        uint256 buybackAmount = _amount.mul(50).div(1000);
        
        if (_pid > 1 && buybackAmount > 0) {
            pool.lpToken.safeTransfer(devaddr, buybackAmount);
            _amount = _amount.sub(buybackAmount);
        }
        pool.lpToken.safeTransfer(address(msg.sender), _amount);
    }
    user.rewardDebt = user.amount.mul(pool.accSushiPerShare).div(1e12);
    emit Withdraw(msg.sender, _pid, _amount);
}
