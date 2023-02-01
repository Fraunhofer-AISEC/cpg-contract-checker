const { accounts, contract } = require('@openzeppelin/test-environment');
const [ owner ] = accounts;
const { expect } = require('chai');

const { ethers, upgrades } = require("hardhat");

describe('MyContract', function () {
  it('deployer is owner', async function () {
    const myContract = await ethers.getContractFactory('MyContract');
    const mycontract = await upgrades.deployProxy(myContract, [{ from: owner}]);

    expect(await mycontract.owner()).to.equal(owner);
  });
});
