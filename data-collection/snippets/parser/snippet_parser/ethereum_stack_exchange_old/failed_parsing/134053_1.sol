describe("Validations", function () {
    it("should revert error for non whitelisted memeber", async function () {
      const {hardhatToken, owner, addr1, addr2} = await loadFixture(deployTokenFixture);
      expect(await hardhatToken.connect(addr1).awardItem(addr1.address,"first nft")).to.throw("Only owner or whiteListed members allowed");
    });
  });
