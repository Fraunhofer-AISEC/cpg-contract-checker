contract('erc20 deployed', function(accounts) {
    const REVERT = "VM Exception while processing transaction: revert";
    it("should not transfer 1 token from address[0] to address[1]", async function() {
        try {
            await erc20Instance.transfer(accounts[1], 1);
            throw null;
        }
        catch (error) {
            assert(error, "Expected an error but did not get one");
            assert(error.message.startsWith(REVERT), "Expected '" + REVERT + "' but got '" + error.message + "' instead");
        }
    });
});
