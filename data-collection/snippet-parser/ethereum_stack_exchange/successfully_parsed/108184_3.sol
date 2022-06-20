function testBuying() public {
    
    uint amount = 110;
    instance.buySomething{value: amount}();

    Assert.equal(instance.boughtItems, 1, "Routes amount is not equal");
}
