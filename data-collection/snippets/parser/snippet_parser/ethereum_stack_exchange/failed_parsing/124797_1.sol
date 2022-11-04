import { expect } from "chai";
import { ethers } from "hardhat";
import { ACDMToken, ACDMToken__factory, POPToken, POPToken__factory, TSTToken, TSTToken__factory, UniswapAdapter, UniswapAdapter__factory } from "../typechain";


describe("UniswapAdapter", function () {
    let bob: SignerWithAddress,
        alice: SignerWithAddress;
    let acdmToken: ACDMToken;
    let popToken: POPToken;
    let tstToken: TSTToken
    let uniswapAdapter: UniswapAdapter;


    before(async () => {
        [bob, alice] = await ethers.getSigners();
    })

    beforeEach(async () => {
        const ACDMToken = await ethers.getContractFactory("ACDMToken") as ACDMToken__factory;
        const POPToken = await ethers.getContractFactory("POPToken") as POPToken__factory;
        const TSTToken = await ethers.getContractFactory("TSTToken") as TSTToken__factory;
        const UniswapAdapter = await ethers.getContractFactory("UniswapAdapter") as UniswapAdapter__factory;
        acdmToken = await ACDMToken.deploy();
        await acdmToken.deployed();
        popToken = await POPToken.deploy();
        await popToken.deployed();
        tstToken = await TSTToken.deploy();
        await tstToken.deployed();
        uniswapAdapter = await UniswapAdapter.deploy(acdmToken.address, popToken.address, tstToken.address);
        await uniswapAdapter.deployed();
    })

    it("Checking  owner balance of tokens", async function () {
        const adcmBalance = ethers.utils.parseEther("100");
        expect(await acdmToken.balanceOf(uniswapAdapter.address)).to.be.equal(adcmBalance)
    });

    it("Pair", async function () {

        await uniswapAdapter.createPair(acdmToken.address, popToken.address)
    });

    

    
    

    

    
    
})
