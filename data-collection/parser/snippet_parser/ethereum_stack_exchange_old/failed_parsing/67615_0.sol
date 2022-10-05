it("should accept a list of obj's and return a string & addr", async () => {
    let cInstance = await Contract.deployed("tester2");
    let cAddress = cInstance.address;
    let returnResult = await cInstance.submission.call("tester2","0xdade","type2","0xwizards",[1,"2","4",4]);
    assert.equal(returnResult.valueOf(), "0xdade", {contractaddress});
