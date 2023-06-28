   function vestedAmount(uint64 timestamp) public view virtual returns (uint256) {
   return _vestingSchedule(address(this).balance + released(), timestamp);
   }  
