const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("My NFT", () => {
  let deployer;
  let myNFT;

  
  before(async () => {
    [deployer] = await ethers.getSigners();
    const MyNFT = await ethers.getContractFactory('MyNFT');
    myNFT = await MyNFT.deploy();
    await myNFT.deployed();
  });

  describe('Receiving a value returned by a view function', () => {
    it('The deployer should be the s/c owner', async  () => {
      const owner = await myNFT.owner();
      expect(owner).to.equal(deployer.address);
    });
  });
  
  describe('Receiving a value returned by a transacting function', () => {
    it('Should return a correct ID of the newly minted item', async () => {
      const newMintItem = {
        id: 1,
        uri: 'ipfs://Qme3QxqsJih5psasse4d2FFLFLwaKx7wHXW3Topk3Q8b14',
      };
      const newItemId = await myNFT.mintNFT(deployer.address, newMintItem.uri);
      expect(newItemId).to.equal(newMintItem.id);
    });
  });
});
