
const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("EcoNexus", function () {
  
  let econexus;
  let owner;
  let renter;
  let asset;

  
  beforeEach(async function () {
    [owner, renter] = await ethers.getSigners();
    const EcoNexus = await ethers.getContractFactory("EcoNexus");
    econexus = await EcoNexus.deploy();
    await econexus.deployed();
  });

  
  describe("createAsset", function () {
    it("should create a new asset", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      asset = await econexus.getAsset(1);
      expect(asset.name).to.equal("Test Asset");
      expect(asset.category).to.equal("Test Category");
      expect(asset.owner).to.equal(owner.address);
      expect(asset.available).to.equal(true);
    });
  });

  
  describe("setAvailability", function () {
    it("should change the availability of an asset", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      await econexus.setAvailability(1, false);
      asset = await econexus.getAsset(1);
      expect(asset.available).to.equal(false);
    });
  });

  
  describe("rentAsset", function () {
    it("should rent an available asset", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      await econexus.rentAsset(1);
      asset = await econexus.getAsset(1);
      expect(asset.available).to.equal(false);
      expect(await econexus.ownerOf(1)).to.equal(renter.address);
    });

    it("should not rent an unavailable asset", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      await econexus.rentAsset(1);
      await expect(econexus.rentAsset(1)).to.be.revertedWith(
        "Asset is not available for rent."
      );
    });
  });

  
  describe("returnAsset", function () {
    it("should return a rented asset", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      await econexus.rentAsset(1);
      await econexus.returnAsset(1);
      asset = await econexus.getAsset(1);
      expect(asset.available).to.equal(true);
      expect(await econexus.ownerOf(1)).to.equal(owner.address);
    });

    it("should not return an asset if not rented by the caller", async function () {
      await econexus.createAsset("Test Asset", "Test Category");
      await econexus.rentAsset(1);
      await expect(econexus.connect(owner).returnAsset(1)).to.be.revertedWith(
        "Only the renter can retrun the asset."
      );
    });
  });
});
