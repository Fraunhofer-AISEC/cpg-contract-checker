describe("It mints 10NFTs", function () {
        it("Should be reverted as caller is not owner", async function () {
          await expect(mintNFT.connect(user).bulkMint(tokensUris)).to.be.revertedWith(
            "Ownable: caller is not the owner"
          )
        })
        it("Should emit the NFtMinted event after each token minted", async function () {
          await mintNFT.bulkMint(tokensUris)
          for (i = 0; i < tokensUris.length; i++) {
            let index = i
            let uri = tokensUris[index]
            await expect(mintNFT.safeMint(deployer.address, uri))
              .to.emit(mintNFT, "NFTMinted")
              .withArgs(index, uri)
          }
        })
