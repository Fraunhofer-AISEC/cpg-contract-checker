it('should invoke the fallback function', async () => {
    const tx = deployer.sendTransaction({
        to: demoContract.address,
        data: "0x",
    });
    await expect(tx)
        .to.emit(demoContract, 'Error')
        .withArgs('call of a non-existent function');
});
