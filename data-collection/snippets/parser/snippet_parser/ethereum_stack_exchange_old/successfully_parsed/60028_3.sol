function testBurn() public {
    mytoken.burn(1000);
    uint balance = mytoken.balanceOf(msg.sender);
    uint expected = 100000000000000000 - 1000;
    Assert.equal(balance, expected, "Balance should be reduced.");

}
