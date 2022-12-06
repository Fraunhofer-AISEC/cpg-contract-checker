it("non-owner cannot create race", async () => {
        const instance = await raceFactory.deployed();
        await expectRevert(instance.createUpcomingRace({from: accounts[1]}), "Ownable: caller is not the owner");
    });
