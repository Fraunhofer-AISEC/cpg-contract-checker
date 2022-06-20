const Routes = artifacts.require("Routes");

contract ("Routes", (accounts) => {
    before(async () =>  {
        instance = await Routes.deployed()
    })

    it ('ensures that the array is empty', async () => {
        let count =  await instance.setRoute()
        assert.equal(count, 0, 'The array should be empty')
    })
})
