it("should reject", async function () {
    try {
        await deployedInstance.myOperation1();
        assert.fail("The transaction should have thrown an error");
    }
    catch (err) {
        assert.include(err.message, "revert", "The error message should contain 'revert'");
    }
});
