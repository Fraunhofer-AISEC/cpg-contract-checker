  it("Should emit MyEventWithData", async function () {
    const EventEmitter = await ethers.getContractFactory("EventEmitter");
    const eventEmitter = await EventEmitter.deploy();
    await eventEmitter.deployed();

    await expect(eventEmitter.emitMyEventWithData(42, "foo"))
      .to.emit(eventEmitter, "MyEventWithData")
      .withArgs(42, "foo");
  });
