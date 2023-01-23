    function callApprove(address denomAsset, address spenderForApprove, uint256 amount) public onlyOwner {
        IERC20 denomAssetContract = IERC20(denomAsset);
      
        uint256 tokenAmountOfPool = denomAssetContract.balanceOf(address(this));
        require(amount <= tokenAmountOfPool, "Not enough token in the Pool!");

        bool approveSuccess = denomAssetContract.approve(spenderForApprove, amount);
        require(approveSuccess, "Approvement failed!");
    }

    function callSwap(address denomAsset, address spenderForApprove, uint256 amountIn) public onlyOwner {
        
        callApprove(denomAsset, spenderForApprove, amountIn);

        IMyUni myUniContract = IMyUni(myUniContractAddress);
        myUniContract.swapExactInputSingle(amountIn);
    }
