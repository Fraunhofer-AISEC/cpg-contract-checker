  it("Should revert claimToken if msg.sender is 0x0.", async function() {
    await bridgeBase.claimToken(rinkebyToken.address, 50).call({from:'0x0000000000000000000000000000000000000000'});
  })
