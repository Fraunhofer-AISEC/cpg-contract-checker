it("fails to call the function", async () => {
    await expect(
        contract.function()
    ).to.be.revertedWith("Custom revert message");
});
