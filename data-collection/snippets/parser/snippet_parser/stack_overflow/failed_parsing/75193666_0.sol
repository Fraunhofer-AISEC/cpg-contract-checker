 it("should allow the owner of the campaign to withdraw funds if the campaign is successful", async () => {
    const target = ethers.utils.parseEther("1");
    await contract
      .connect(aliceAccount)
      .createCampaign(
        "Test Campaign",
        "Test Description",
        target,
        "testimage.jpg"
      );
    await contract
      .connect(bobAccount)
      .donateToCampaign(0, { value: ethers.utils.parseEther("1") });
  
    const campaign = await contract.campaigns(0);
    const ownerInitialBalance = await aliceAccount.getBalance();
    const tx = await contract.connect(aliceAccount).withdrawFunds(0);
    const receipt = await tx.wait()
   const ownerFinalBalance = await aliceAccount.getBalance();
    
    const result = ownerInitialBalance.add(target).sub(receipt.gasUsed)
   
    expect(campaign.status).to.equal(2);
    expect(ownerFinalBalance).to.equal(result);
   
  });
