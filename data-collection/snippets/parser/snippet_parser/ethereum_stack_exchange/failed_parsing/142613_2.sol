import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import "./SwapChainV2";
import "./SwapValue";

describe.only("SwapChain V2 test", async function () {

    async function deploy() {
        const factoryUtils = await ethers.getContractFactory("Utils");
        const contractUtils = await factoryUtils.deploy();

        const factorySwapValue = await ethers.getContractFactory("SwapValue");
        const contractValue = await factorySwapValue.deploy();

        const factory = await ethers.getContractFactory("SwapChainV2");
        const contractSwapChain = await factory.deploy(
            contractUtils.address, 
            contractValue.address
        );

        const accounts = await ethers.getSigners();

        return { contractSwapChain, contractValue, contractUtils }
    }

    it("On register new user, get users call returns relevant count", async function() {
        const { contractSwapChain } = await loadFixture(deploy);
        
    }
}

