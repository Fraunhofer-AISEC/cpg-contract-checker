function testTheThrow() {
    MyContract mycontract = new MyContract(); 
    ThrowProxy throwproxy = new ThrowProxy(address(mycontract)); 
    MyContract(address(throwproxy)).functionThatShouldThrow();
    bool r = throwproxy.execute.gas(200000)(); 
    Assert.isFalse(r, "Should be false because is should throw!");
}
