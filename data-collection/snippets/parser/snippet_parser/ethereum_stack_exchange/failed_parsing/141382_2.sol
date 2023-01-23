const { assert, expect } = require("chai")
const { network, deployments, ethers, getNamedAccounts } = require("hardhat")
const { developmentChains, networkConfig } = require("../../helper-hardhat-config")

!developmentChains.includes(network.name)
    ? describe.skip
    : describe("Voting Unit Tests", function () {
          let accounts, voting, votingContract, intervalRegister, intervalVoting, player, deployer 
          beforeEach(async () => {
              accounts = await ethers.getSigners()
              deployer = accounts[0]
              player = accounts[1] 
              await deployments.fixture(["voting"]) 
              voting = await ethers.getContract("Voting")
              intervalRegister = await voting.getRegisterTime()
              intervalVoting = await voting.getVotingTime() 
          })

          describe("constructor", function () {
              it("initializes the voting correctly", async function () {
                  const votingState = (await voting.getState()).toString()
                  assert.equal(votingState, "0")
                  const candidatesCount = (await voting.getCandidatesCount()).toString()
                  const expectedCandidatesCount =
                      networkConfig[network.config.chainId]["candidatesCount"]
                  assert.equal(candidatesCount, expectedCandidatesCount)
                  
                  const expectedintervalRegister =
                      networkConfig[network.config.chainId]["intervalRegister"]
                  assert.equal(intervalRegister.toString(), expectedintervalRegister)

                  const expectedintervalVoting =
                      networkConfig[network.config.chainId]["intervalRegister"]
                  assert.equal(intervalVoting.toString(), expectedintervalVoting)
              })
          })

          describe("register", function () {
              it("can register a voter", async function () {
                  
                  await voting.register(player.address)
                  
                  const registered = await voting.getVoterAuthorized(player.address)
                  assert.equal(registered, true)
                  const voted = await voting.getVoterVoted(player.address)
                  assert.equal(voted, false)
              })
              it("emits the event", async function () {
                  await expect(voting.register(player.address)).to.emit(voting, "VoterRegistered")
              })

              it("reverts when the state isn't correct", async function () {
                  await network.provider.send("evm_increaseTime", [intervalRegister.toNumber() + 1])
                  await network.provider.request({ method: "evm_mine", params: [] })
                  await voting.performUpkeep([])
                  await expect(voting.register(player.address)).to.be.revertedWith(
                      "Voting__WrongState"
                  )
              })

              it("only owner can register voters", async function () {
                  
                  votingContract = await voting.connect(player) 
                  const person = accounts[0].address
                  await expect(votingContract.register(person)).to.be.revertedWith(
                      "Ownable: caller is not the owner"
                  )
              })

              it("user can be registered only once", async function () {
                  await voting.register(player.address)
                  await expect(voting.register(player.address)).to.be.revertedWith(
                      "Voting__AlreadyRegistered"
                  )
              })
          })

          describe("vote", function () {
              
              
              
              
              
              

              it("reverts when the state isn't correct", async function () {
                  await voting.register(player.address)
                  votingContract = await voting.connect(player)
                  await expect(votingContract.vote(0)).to.be.revertedWith("Voting__WrongState")
              })

              it("reverts when a voter doesn't authorized", async function () {
                  
                  await network.provider.send("evm_increaseTime", [intervalRegister.toNumber() + 1])
                  await network.provider.request({ method: "evm_mine", params: [] })
                  await voting.performUpkeep([])
                  votingContract = await voting.connect(player)
                  await expect(votingContract.vote(0)).to.be.revertedWith("Voting__NotAuthorized")
              })

              it("reverts when a voter already voted", async function () {
                  await voting.register(player.address)
                  await network.provider.send("evm_increaseTime", [intervalRegister.toNumber() + 1])
                  await network.provider.request({ method: "evm_mine", params: [] })
                  await voting.performUpkeep([])
                  votingContract = await voting.connect(player)
                  await votingContract.vote(0)
                  await expect(votingContract.vote(0)).to.be.revertedWith("Voting__AlreadyVoted")
              })
          })
      })

