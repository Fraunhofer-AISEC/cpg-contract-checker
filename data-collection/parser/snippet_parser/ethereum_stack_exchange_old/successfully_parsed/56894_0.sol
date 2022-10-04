
function testSelectValidOrgCredentialCount() public {

    address contractOwner = credentialFactory.getOwner();
    uint256 testVal = uint256(credentialFactory.selectOrgCredentialCount(contractOwner));
    uint256 expected = 4;
    Assert.equal(testVal, expected, "Expected Credential Count (4)");
}
