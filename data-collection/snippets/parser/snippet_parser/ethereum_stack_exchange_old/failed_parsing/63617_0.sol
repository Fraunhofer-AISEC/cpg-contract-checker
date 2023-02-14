contract('erc20 deployed', function(accounts) {
    it("should not transfer 1 token from address[0] to address[1]", function(done) {
        try{
            return erc20Instance.transfer(accounts[1], 1);
            should.fail("No error was thrown trying to cheat balance");
        }
        catch(error){
            done();
        }
    });
});
