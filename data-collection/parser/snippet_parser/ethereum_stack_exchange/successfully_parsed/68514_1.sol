function testOwnerCanKillContract() public {
  XToken xtn = XToken(DeployedAddresses.XToken());
　bool isKilled = nmt.kill();
　Assert.equal(isKilled, true, "Owner should have to kill contract with selfdestruct.");
}
