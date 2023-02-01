it("should validate for 721", async function () {
    
    await expectRevert(
        registry.stakeNFT(nft721Contract, 1, {from: accounts[2], value: listingFee}),
        "Not owner of nft 721"
    );
}
