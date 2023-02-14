@@ -15,14 +15,1 @@ contract StakingPool {
     uint256 public immutable progressiveStakingBlocks;
 
     struct InvestorInfo {
         uint256 depositedAmount;
-        uint256 withdrawedAmount;
+        uint256 shares;
         uint256 claimedRewardIndex;
     }
 
     mapping(address => InvestorInfo) private investorInfo;
     uint256 private rewardIndex;
     uint256 private totalDepositedAmount;
-    uint256 private totalWithdrawedAmount;
+    uint256 private totalShares;
 
     constructor(
         address _stakedToken,
@@ -45,7 +45,9 @@ contract StakingPool {
         stakedToken.transferFrom(msg.sender, address(this), amount);
 
         investorInfo[msg.sender].depositedAmount += amount;
+        investorInfo[msg.sender].shares += amount;
         totalDepositedAmount += amount;
+        totalShares += amount;
     }
 
     function withdraw(uint256 amount) external {
@@ -56,10 +58,10 @@ contract StakingPool {
 
         _claim();
 
-        require(amount <= stakeOf(msg.sender), "insufficient stake");
+        require(amount <= balanceOf(msg.sender), "insufficient stake");
 
-        investorInfo[msg.sender].withdrawedAmount += amount;
-        totalWithdrawedAmount += amount;
+        investorInfo[msg.sender].shares -= amount;
+        totalShares -= amount;
 
         stakedToken.transfer(msg.sender, amount);
     }
@@ -72,7 +74,7 @@ contract StakingPool {
 
         rewardToken.transferFrom(msg.sender, address(this), rewards);
 
-        rewardIndex += (rewards * MULTIPLIER) / totalStake();
+        rewardIndex += (rewards * MULTIPLIER) / totalShares;
     }
 
     function claim() external {
@@ -84,33 +86,17 @@ contract StakingPool {
         require(_claim() != 0, "no rewards to claim");
     }
 
-    function totalStake() public view returns (uint256) {
-        if (block.number < stakingStartBlock) return 0;
-
-        uint256 elapsed = block.number - stakingStartBlock;
-        if (elapsed >= progressiveStakingBlocks)
-            return totalDepositedAmount - totalWithdrawedAmount;
-
-        uint256 initialStake = (totalDepositedAmount * initialStakingRatio) /
-            MULTIPLIER;
-
-        uint256 linearStake = ((totalDepositedAmount - initialStake) *
-            elapsed) / progressiveStakingBlocks;
-
-        return initialStake + linearStake - totalWithdrawedAmount;
+    function sharesOf(address user) public view returns (uint256) {
+        return investorInfo[user].shares;
     }
 
-    function stakeOf(address user) public view returns (uint256) {
-        if (
-            block.number < stakingStartBlock ||
-            investorInfo[user].depositedAmount == 0
-        ) return 0;
+    function balanceOf(address user) public view returns (uint256) {
+        if (block.number < stakingStartBlock || investorInfo[user].shares == 0)
+            return 0;
 
         uint256 elapsed = block.number - stakingStartBlock;
         if (elapsed >= progressiveStakingBlocks)
-            return
-                investorInfo[user].depositedAmount -
-                investorInfo[user].withdrawedAmount;
+            return investorInfo[user].shares;
 
         uint256 initialStake = (investorInfo[user].depositedAmount *
             initialStakingRatio) / MULTIPLIER;
@@ -118,12 +104,15 @@ contract StakingPool {
         uint256 linearStake = ((investorInfo[user].depositedAmount -
             initialStake) * elapsed) / progressiveStakingBlocks;
 
-        return initialStake + linearStake - investorInfo[user].withdrawedAmount;
+        uint256 withdrawedAmount = investorInfo[user].depositedAmount -
+            investorInfo[user].shares;
+
+        return initialStake + linearStake - withdrawedAmount;
     }
 
     function rewardsOf(address user) public view returns (uint256) {
         return
-            (stakeOf(user) *
+            (investorInfo[user].shares *
                 (rewardIndex - investorInfo[user].claimedRewardIndex)) /
             MULTIPLIER;
     }
