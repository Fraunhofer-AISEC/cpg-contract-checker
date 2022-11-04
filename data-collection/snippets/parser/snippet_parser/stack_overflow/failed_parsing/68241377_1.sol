it("throws an error when called from a different account", async () =>{
  try {
    await fundraiser.setBeneficiary(newBeneficiary, {from: accounts[3]});
    assert.fail("withdraw was not restricted to owners")
  } catch(err) {
    const expectedError = "Ownable: caller is not the owner"
    const actualError = err.reason;
    assert.equal(actualError, expectedError, "should not be permitted")
  }
})
