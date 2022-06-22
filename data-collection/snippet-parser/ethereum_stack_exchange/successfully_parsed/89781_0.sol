updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
updateValueAtNow(balances[_user], previousBalanceTo + _amount);


      
      
      
    function updateValueAtNow(Checkpoint[] storage checkpoints, uint256 _value) internal {
        require(uint128(_value) == _value); 
        if ((checkpoints.length == 0) || (checkpoints[checkpoints.length - 1].fromBlock < block.number)) {
            Checkpoint storage newCheckPoint = checkpoints[checkpoints.length++];
            newCheckPoint.fromBlock = uint128(block.number);
            newCheckPoint.value = uint128(_value);
        } else {
            Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length-1];
            oldCheckPoint.value = uint128(_value);
        }
    }
