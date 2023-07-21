const { ethers, network } = require("hardhat")
const {
    networkConfig,
    developmentChains,
    VERIFICATION_BLOCK_CONFIRMATIONS,
} = require("../helper-hardhat-config")


const FUND_AMOUNT = ethers.utils.parseEther("1") 

module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId
    let vrfCoordinatorV2Address, subscriptionId, vrfCoordinatorV2Mock

    if (chainId == 31337) {
        
        vrfCoordinatorV2Mock = await ethers.getContract("VRFCoordinatorV2Mock")
        vrfCoordinatorV2Address = vrfCoordinatorV2Mock.address
        const transactionResponse = await vrfCoordinatorV2Mock.createSubscription()
        const transactionReceipt = await transactionResponse.wait(1)
        subscriptionId = transactionReceipt.events[0].args.subId
        
        
        
        await vrfCoordinatorV2Mock.fundSubscription(subscriptionId, FUND_AMOUNT)
    } else {
        vrfCoordinatorV2Address = networkConfig[chainId]["vrfCoordinatorV2"]
        subscriptionId = networkConfig[chainId]["subscriptionId"]
    }
    const waitBlockConfirmations = developmentChains.includes(network.name)
        ? 1
        : VERIFICATION_BLOCK_CONFIRMATIONS

    const arguments = [
        vrfCoordinatorV2Address,
        networkConfig[chainId]["gasLane"],
        subscriptionId,
        networkConfig[chainId]["callbackGasLimit"],
        networkConfig[chainId]["keepersUpdateInterval"],
    ]

  log("---------------------------DEPLOY GAME CONTRACT-------------------------")

    const COCWeb3 = await deploy("CodeofConflictWeb3", {
        from: deployer,
        args: arguments,
        log: true,
        waitConfirmations: waitBlockConfirmations,
    })

    
    if (developmentChains.includes(network.name)) {
        log(
            "--Ensure Game Raffle is Valid consumer of VRFCoordinator--"
        )
        const vrfCoordinatorV2Mock = await ethers.getContract("VRFCoordinatorV2Mock")
        await vrfCoordinatorV2Mock.addConsumer(subscriptionId, COCWeb3.address)
    }

    
    if (!developmentChains.includes(network.name) && process.env.ETHERSCAN_API_KEY) {
        log("Verifying...")
        await verify(raffle.address, arguments)
    }

    log("Enter lottery with command:")
    const networkName = network.name == "hardhat" ? "localhost" : network.name
    log(`yarn hardhat run scripts/enterRaffle.js --network ${networkName}`)
    log("----------------------------------------------------")
}

module.exports.tags = ["all", "COCWeb3"]
