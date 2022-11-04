function testTheThrow() {
    MyExposedContract mycontract = new MyExposedContract (); 

    ThrowProxy throwproxy = new ThrowProxy(address(mycontract)); 
    uint num = 7;
    MyExposedContract (address(throwproxy)).callStoreNum(num);

    bool r = throwproxy.execute.gas(200000)(); 

    Assert.isFalse(r, "Should be false because it should throw!");

}
