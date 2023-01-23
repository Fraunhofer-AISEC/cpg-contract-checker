describe("Create Horse", async function() {
        it("horses struct array initialized with 0 horses", async function() {
            expect(await stallionRace.horses.length).to.equal(0)
        })
        it.only("creates a horse and adds it to the struct array", async function() {
            await stallionRace.createHorse("pony", 1, 1000000000)
            expect(stallionRace.horses.length).to.be.greaterThan(0)
        })
    })
