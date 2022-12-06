...
 describe("gift", async function () {
...
    it("doesn't allow others to gift", async function () {
                    

                  const connectacc2 = await LPR.connect(
                      "0x70997970C51812dc3A010C7d01b50e0d17dc79C8"
                  )
                  await expect(
                      connectacc2.gift("0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC")
                  ).to.be.revertedWith("Ownable: caller is not the owner")
              })

