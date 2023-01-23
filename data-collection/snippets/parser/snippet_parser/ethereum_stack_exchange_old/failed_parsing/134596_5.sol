it.only("doesn't allow others to gift", async function () {
                  ;[addr1, addr2] = await ethers.getSigners()
                  expect(await LPR.connect(addr1).gift(addr2)).to.be.revertedWith("Ownable: caller is not the owner")

