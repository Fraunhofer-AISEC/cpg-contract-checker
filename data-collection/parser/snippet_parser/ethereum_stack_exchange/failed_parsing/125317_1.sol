const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Token", function () {

  let bob;
  let alice;
  let token;
  let vault;

  before(async () => {

    [bob, alice] = await ethers.getSigners();

    const Vault = await ethers.getContractFactory("Vault");
    vault = await Vault.deploy();
    await vault.deployed();

    const Token = await ethers.getContractFactory("Token");
    token = await Token.deploy(vault.address);
    await token.deployed();
  });

  it('Vault and minter should be not zero addresses', async function () {
    expect(await token.vault() != 0x0000000000000000000000000000000000000000);
    expect(await token.minter() != 0x0000000000000000000000000000000000000000);
  });

  it('Should change minter', async function () {
    await token.changeMinter(alice.address)
    expect(await token.minter()).to.be.equal(alice.address)

  });

  it('Only minter can mint tokens', async function () {
    const amountToMint = 100;
    await token.mint(alice.address, amountToMint);

  });

  it('Checking a contract is deployed', async function () {
    await token.burn(250);
  });

});
