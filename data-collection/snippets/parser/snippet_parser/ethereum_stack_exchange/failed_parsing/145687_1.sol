    it("Should not unstake if the time is not completed", async function () {

        await testToken.connect(owner).transfer(hyperStaking.address, 1000)
        await hyperStaking.connect(owner).stakeToken(500, 1)
        await expect(hyperStaking.connect(owner).claimReward(1)).to.be.revertedWithCustomError(hyperStaking, "stakeNotOver");

    });
