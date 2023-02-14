contract Test {
    
    PartProduction public partProductionContract = PartProduction(DeployedAddresses.PartProduction());

    function testSetParameters() public {
      string memory _val1 = "someString";
        Assert.equal(partProductionContract.production.val1, _val1, "msg.sender: ");
    }

}
