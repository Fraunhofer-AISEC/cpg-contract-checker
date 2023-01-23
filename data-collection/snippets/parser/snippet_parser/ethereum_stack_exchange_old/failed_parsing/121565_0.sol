it('Should not let user3 accounts[12] to claim rewards just after buy, but after one day: # claims must update, balance should be OK', async() => {
        const busd = await BUSD.deployed();
        const nftMinter = await NFTMinter.deployed();
        const busdPreBalance = await busd.balanceOf(accounts[12]);
        const op1 = await nftMinter.getMyTokens({from: accounts[12]});
        const nftValue = op1[0].value;
        const expectedReward = op1[0].rewardPerInterval ;

        await catchNotEnoughTimePassed(nftMinter.claimReward({from: accounts[12]}));

        await increase(60);

        await nftMinter.claimReward({from: accounts[12]});
        const busdPostBalance = await busd.balanceOf(accounts[12]);
        const busdExpectedBal = busdPreBalance + expectedReward;
        
        assert.equal(busdPostBalance.toString(), busdExpectedBal, "reward quant is not ok");
    })
