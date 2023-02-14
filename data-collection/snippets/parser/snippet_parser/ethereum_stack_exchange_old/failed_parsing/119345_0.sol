function getUserBalance(address userAddress, address tokenAddress)
        public
        view
        returns (uint256)
    {
        return _stakingUserBalance[userAddress][tokenAddress].stakedAmount;
    }

 I'm using chai for my test on js file, but it seems result is not a number :

let amountForSpenderBeforeWithdraw = await AlyraStackingInstance.getUserBalance(spender, DaiInstance.address);
... 
 let amountForSpenderAfterWithdraw = await AlyraStackingInstance.getUserBalance(spender, DaiInstance.address);   

expect(amountForSpenderBeforeWithdraw).to.be.greaterThan(amountForSpenderAfterWithdraw);
