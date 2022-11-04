const { assert, expect } = require("chai")
const { ethers, deployments, getNamedAccounts } = require("hardhat")
const {developmentChains,

} = require("../../helper-hardhat-config")

!developmentChains.includes(network.name)
    ? describe.skip
    : describe("LPR", function () {
          let LPR, deployer, addr1, addr2, addr3
          beforeEach(async function () {
              ;[addr1, addr2, addr3] = await ethers.getSigners()
              deployer = (await getNamedAccounts()).deployer
              await deployments.fixture(["all", "LPR"])
              LPR = await ethers.getContract("LPR", deployer)
          })
             describe("gift", async function () {
                  it("doesn't allow others to gift", async function () {
                  
                   expect(await LPR.connect(addr1.address).gift(addr2.address)).to.be.revertedWith("Ownable: caller is not the owner")
              })
        })
})
