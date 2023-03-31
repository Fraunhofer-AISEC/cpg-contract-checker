 uint256 profit = wethAmount.sub(totalAmountOwed);        
 require(IERC20(WETH).balanceOf(address(this)) >= profit, "Insufficient balance to transfer profits");
 IERC20(WETH).transfer(owner, profit); ...some others have suggested the problem's somewhere else but it relates to weth somehow.
