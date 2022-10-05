✓ should allow someone to invest and record balance
✓ should send 1 ERC20 token to participant (120ms)
✓ softcap should not return reached when amountRaised is smaller
✓ softcap should return reached when amountRaised is bigger
✓ hardcap should not return reached when amountRaised is smaller
✓ hardcap should return reached when amountRaised is bigger
✓ should give 1 ETH in change as hard cap was exceeded (275ms)
✓ should return a State of 'Successful' when hardcap reached (61ms)
✓ beneficiary should be able to withdraw funds
1) should return a State of 'Finished' when beneficiary has funds
> No events were emitted


 22 passing (2s)
 1 failing

 1) Contract: Sale should return a State of 'Finished' when beneficiary has funds:
 AssertionError: State of contract was not 'Finished': expected '4' to equal 6
  at test/2Crowdsale_Test.js:243:14
  at <anonymous>
  at process._tickDomainCallback (internal/process/next_tick.js:228:7)
