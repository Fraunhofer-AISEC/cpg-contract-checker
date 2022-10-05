  let genesisTokenHolders: Array<string>;

        beforeEach(async () => {
            genesisTokenHolders = new Array(230).fill('0x0000000000000000000000000000000000000000')
            genesisTokenHolders[1] = addr1.address;
            genesisTokenHolders[2] = addr2.address;
        })

        describe('airdrop genesis tokens', async () => {
            it('should fail when non-owner calls the function', async () => {
                
                let addGenesisHoldersTx = await myToken.addGenesisTokenHolderAddresses(genesisTokenHolders)
                await addGenesisHoldersTx.wait();
                    
                await expect(await myToken.connect(addr1).airdropTokensToGenesisHolders(1, 2)).to.be.revertedWith("Ownable: caller is not the owner");
            })
        
            it('should succeed when called by the owner', async () => {

                let addGenesisHoldersTx = await myToken.addGenesisTokenHolderAddresses(genesisTokenHolders)
                await addGenesisHoldersTx.wait();
 
                let airdropTx = await myToken.connect(deployer).airdropTokensToGenesisHolders(1,2);
                await airdropTx.wait();
            
                
                await expect(await myToken.ownerOf(1)).to.hexEqual(addr1.address)
                await expect(await myToken.ownerOf(2)).to.hexEqual(addr2.address)
                
                await expect(await myToken.ownerOf(1000)).to.be.reverted;
            })
        });
