it("Should fetch balance of a Nft1155Upgradeable", async function () {
  const {token, owner} = await loadFixture(deployNFT);

   expect(await token.balanceOf(owner.address, 1)).to.equal(0);
});

