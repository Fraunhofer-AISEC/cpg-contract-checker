import { ethers } from "hardhat";
import { expect } from "chai";
import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";

describe.only("SmartWallet test suite", async function() {

    async function deploy() {
        const factory = await ethers.getContractFactory("SmartWallet");
        const contract = await factory.deploy();

        return { contract };
    }

    it("On emit new tokens balance of user changes", async function() {
        const accounts = await ethers.getSigners();
        const owner = accounts[0].address;
        const totalAmount = 42

        const { contract } = await loadFixture(deploy);
        await contract.GrantAllowance(owner, totalAmount);

        await expect(await contract.CheckAllowance(owner)).to.be.equal(totalAmount);
    });

})
