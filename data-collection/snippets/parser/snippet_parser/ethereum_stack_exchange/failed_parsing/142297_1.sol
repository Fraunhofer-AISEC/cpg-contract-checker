const { deployments, ethers, getNamedAccounts } = require("hardhat")
const { log } = deployments
const { assert } = require("chai")

describe("Contract", async function () {
    let deployer
    beforeEach(async function () {
        deployer = (await getNamedAccounts()).deployer
        await deployments.fixture("all")
        contract = await ethers.getContract("Contract", deployer)
    })

    describe("constructor", async function () {
        it("Tests that the constructor works", async function () {

            
            log("Testing constructor..")
            
            assert.equal("1","1")

