describe("Validate length on push", function () {
  it("Should increment the length after a push is done", async function () {
    const contract = await ethers.getContractFactory("A");
    const instance = await contract.deploy();
    await instance.deployed();

    
    const initialLength = ethers.BigNumber.from(await ethers.provider.getStorageAt(instance.address, 0));

    expect(initialLength.eq(0)).to.equal(true);

    await instance.test();

    
    const newLength = ethers.BigNumber.from(await ethers.provider.getStorageAt(instance.address, 0));

    expect(newLength.eq(1)).to.equal(true);
  });
});
