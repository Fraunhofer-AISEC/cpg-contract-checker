describe("burning tokens", () => {
              it("checks that the ico is ended before burning", async () => {
                  const icoState = await ico.getState()
                  assert.equal(icoState, 1) 
              })

              it("only allows manager to call", async () => {
                  const icoInvestor1connected = ico.connect(inverstor1)
                  await expect(icoInvestor1connected.burn()).to.be.rejectedWith("not owner")
              })

              it("should burn tokens", async () => {
                  const icoState = await ico.getState()
                  assert.equal(icoState, 1) 
                  
                  
                  

                  await ico.burn()
                  const founderBal = await ico.getFounderBalance()
                  assert.equal(founderBal.toString(), "0")
              })
          })
