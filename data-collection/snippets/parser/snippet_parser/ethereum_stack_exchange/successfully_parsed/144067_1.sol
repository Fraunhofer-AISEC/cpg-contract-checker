 function Withdraw() public {
     require(block.timestamp >= lastWithdrawTime + 24 hours, "You can call this function only once every 24 hours");
     lastWithdrawTime = block.timestamp;
     for (uint256 i = 0; i < addresses.length; i++) {
         address _address = addresses[i];
         if (balances[_address] > 0) {
             uint256 _amount = balances[_address];
             require(IERC20(address(this)).transfer(_address, _amount), "Transfer failed");
             emit Withdrawal(_address, _amount);
             totalRewardPayment += _amount;
             balances[_address] = 0;
         }
     }
 }
