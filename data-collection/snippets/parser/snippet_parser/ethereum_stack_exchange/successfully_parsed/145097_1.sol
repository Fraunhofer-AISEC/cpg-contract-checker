   function vestedAmount(address token, uint64 timestamp) public view virtual returns 
   (uint256) {
   return _vestingSchedule(IERC20(token).balanceOf(address(this)) + released(token), 
   timestamp);
   }
