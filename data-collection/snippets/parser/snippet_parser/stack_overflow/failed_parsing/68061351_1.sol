const withdraw = sut.connect(lp1).withdraw(utils.parseUnits("500"))
await expect(withdraw).eventually.to.rejectedWith(Error, "VM Exception while processing transaction: reverted with reason string 'Pool: not enough balance'")
