const { expect } = require("chai")

const toWei = (num) => ethers.utils.parseEther(num.toString())

describe("NFTMarketplace", function () {
    let feePercent = 1
    let nft, marketplace, deployer, addr1, addr2
    let URI = "SampleURI"
    beforeEach(async () => {
        const NFTFactory = await ethers.getContractFactory("NFT")
        const MarketplaceFactory = await ethers.getContractFactory(
            "Marketplace"
        )
        const accounts = await ethers.getSigners()
        deployer = accounts[0]
        addr1 = accounts[1]
        addr2 = accounts[2]
        nft = await NFTFactory.deploy()
        marketplace = await MarketplaceFactory.deploy(feePercent)
    })
    describe("Deployment", function () {
        it("Should track name and symbol of the nft collection", async () => {
            expect(await nft.name(), "DApp NFT")
            expect(await nft.symbol(), "DAPP")
        })
        it("Should feeAccount and feePercent of the marketplace", async () => {
            expect(await marketplace.feeAccount(), deployer.address)
            expect(await marketplace.feePercent(), feePercent)
        })
    })
    describe("Minting NFTs", function () {
        it("Should track each minted NFT", async () => {
            await nft.connect(addr1).mint(URI)
            expect(await nft.tokenCount(), 1)
            expect(await nft.balanceOf(addr1.address), 1)
            expect(await nft.tokenURI(1), URI)

            await nft.connect(addr2).mint(URI)
            expect(await nft.tokenCount(), 2)
            expect(await nft.balanceOf(addr2.address), 1)
            expect(await nft.tokenURI(2), URI)
        })
    })
    describe("Creating items", function () {
        beforeEach(async function () {
            await nft.connect(addr1).mint(URI)
            await nft
                .connect(addr1)
                .setApprovalForAll(marketplace.address, true)
        })
        it("Should track created items, transfer NFT from seller to marketplace and emit an event", async () => {
            await expect(
                marketplace.connect(addr1).listItem(nft.address, 1, toWei(1))
            )
                .to.emit(marketplace, "ItemListed")
                .withArgs(1, 1, toWei(1), nft.address, addr1.address)
        })
    })
})
