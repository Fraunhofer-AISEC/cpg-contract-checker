function fetchPastBalance(uint256 historicalBlock) public view returns(uint256){
   return IERC20(tokenAddress).balanceOf(msg.sender, { magicOverrideStuff: historicalBlock });
}
