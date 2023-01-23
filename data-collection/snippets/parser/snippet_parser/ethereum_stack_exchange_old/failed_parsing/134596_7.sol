    it("doesn't allow others to gift", async function () {
        await expect(
            LPR.connect(addr2).gift("0x90F79bf6EB2c4f870365E785982E1f101E93b906")
        ).to.be.revertedWith("Ownable: caller is not the owner")
    })


 it("doesn't allow others to gift", async function () {
        await expect(
            LPR.connect(addr2).gift(addr1.address)
        ).to.be.revertedWith("Ownable: caller is not the owner")
    })
