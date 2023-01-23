  it('should deny refunds before end', async function () {
    await expectThrow(this.crowdsale.claimRefund({ from: investor }), EVMRevert);
    await increaseTimeTo(this.openingTime);
    await expectThrow(this.crowdsale.claimRefund({ from: investor }), EVMRevert);
  });

  it('should deny refunds after end if goal was reached', async function () {
    await increaseTimeTo(this.openingTime);
    await this.crowdsale.sendTransaction({ value: goal, from: investor });
    await increaseTimeTo(this.afterClosingTime);
    await expectThrow(this.crowdsale.claimRefund({ from: investor }), EVMRevert);
  });
