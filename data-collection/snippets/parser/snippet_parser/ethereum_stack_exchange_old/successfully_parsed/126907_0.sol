

function buyToken () public payable {
    Assert.notEqual(msg.sender, TestsAccounts.getAccount(0), "Owner cannot purchase");
    buyToken ();
    Assert.equal(balanceOf(msg.sender), 10000, "Purchased amount does not match the rate");
}
