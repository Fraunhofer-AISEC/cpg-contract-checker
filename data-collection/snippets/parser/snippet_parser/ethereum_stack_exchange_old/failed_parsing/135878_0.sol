developmentChains.includes(network.name)
    ? describe.skip
    : describe("multi sig staging test", function () {
        let multiSig, chainId, user
          beforeEach(async function () {
              chainId = network.config.chainId              
              multiSig = await ethers.getContract("MultiSig")  
              
              user = "0xEC6Cb786Fd27BA1A79809A88A44d3b9A2b06992A"
          })
          it("allows owners to propose and execute transactions that have set number of confirmations", async function () {
            const {deployer, owner2, owner3} = await getNamedAccounts()
            
            
            
            await multiSig.proposeTransaction(user, 7, "0x")
            await multiSig.connect(owner2).confirmTransaction(0)
          })
      }) 
