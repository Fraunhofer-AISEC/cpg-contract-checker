it("Try approving for user 1 the transfer of their tokens from the contract", async function() {
      await deployFunds.connect(signers[1]).approveUser(1000);
    })

    it("Try depositing and the price of the pool tokens should be equal to one since it is new", async function() {
      const tx = await deployFunds.connect(signers[1]).deposit(1000, 2);
      const receipt = await tx.wait();
      
      filter = receipt.events?.filter((x) => {return x.event == "Deposit"});
      poolId = filter.length > 0 ? filter[0].args[1] : '0x000';
      tokensForUser = filter.length > 0 ? filter[0].args[2]: "0";
      mintedTokens = await deployERC20.balanceOf(user1);
      expect(filter.length).above(0);
      expect(poolId).to.equal(2);
      expect(tokensForUser).to.equal(1000);
    })
