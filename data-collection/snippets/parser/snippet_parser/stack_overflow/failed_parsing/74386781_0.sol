const  hre = require('hardhat')
const { expect, assert } = require('chai')

describe('ProperSubsetFund', async function () {
  
  let deployERC20, deployer, user1, user2, trader1, trader2
  let signers

  beforeEach(async function () {
    
    signers = await hre.ethers.getSigners()
    

    
    deployer = signers[0].address
    user1 = signers[1].address
    user2 = signers[2].address
    trader1 = signers[3].address
    trader2 = signers[4].address

    
    const contractERC20 = await hre.ethers.getContractFactory('ProperSubsetERC20')
    
    const contractLaunchpad = await hre.ethers.getContractFactory('ProperSubsetFactory')
    
    const contractFunds = await hre.ethers.getContractFactory('ProperSubsetFund')

    
    deployERC20 = await contractERC20.connect(signers[0]).deploy(true)
    
  });

  describe('Deployment and Ownership', function () {
    it('Check if the owner is the deployer', async function () {

        expect(await deployERC20.owner()).to.equal(deployer)
    });
  });
})

