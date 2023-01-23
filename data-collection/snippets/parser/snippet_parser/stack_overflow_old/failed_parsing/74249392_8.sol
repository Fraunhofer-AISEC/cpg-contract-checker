const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Players", function () {
  it("Sets up and returns player info via public state variable", async function () {
    const Players = await ethers.getContractFactory("Players");
    const players = await Players.deploy();
    await players.deployed();
    
    const [signer] = await ethers.getSigners();
    const playerInfo = {
      name: "Test name",
      gameId: 1,
    }

    await players.setUpPlayerInfo(signer.address, playerInfo);

    const playerInfoResponse = await players.playerInfo(signer.address)

    expect(playerInfoResponse[0]).to.equal(playerInfo.name);
    expect(playerInfoResponse[1]).to.equal(playerInfo.gameId);
  });
});
