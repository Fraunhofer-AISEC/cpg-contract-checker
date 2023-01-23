const { expect, assert } = require("chai");
const { network, deployments, ethers } = require("hardhat");

describe("Crud uint test", () => {
  let crud, deployer;
  const name = "";
  const age = 0;

  beforeEach(async () => {
    deployer = (await getNamedAccounts()).deployer;
    const Crud = await ethers.getContractFactory("Crud");
    crud = await Crud.deploy();
    await crud.deployed();
  });

  it("Initial form must be empty", async () => {
    await crud.createForm(age, name);
    assert(crud.createForm.name, name);
  });
});

