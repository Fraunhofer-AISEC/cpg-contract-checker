it("Should have emit the event at the beginning of the Election Period!", async () => {
    const RESULT = await contract.getResult();

    await expect(contract.deployTransaction)
        .to.emit(contract, "LogStartElection")
        .withArgs("Beginning of the election period, ballot box released!", RESULT);
});
