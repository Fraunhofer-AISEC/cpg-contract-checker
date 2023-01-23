function calculateReward(uint256 _PFP) public view returns (uint256) {
   Stake memory st = getStakingInfo(_PFP);
   uint256 duration = block.timestamp - st.since;
   duration = SafeMath.div(duration, 1 days);
   return SafeMath.mul(duration, st.ratePerDay);
}
