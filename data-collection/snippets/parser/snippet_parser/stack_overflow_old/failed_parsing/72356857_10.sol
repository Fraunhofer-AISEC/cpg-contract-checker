describe('Receiving a value returned by a transacting function', () => {
    it('Should return a correct ID of the newly minted item', async () => {
      const newMintItem = {
        id: 1,
        uri: 'ipfs://QmY6KX35Rg25rnaffmZzGUFb3raRhtPA5JEFeSSWQA4GHL',
      };
      const txResponse = await myNFT.mintNFT(deployer.address, newMintItem.uri);
      const txReceipt = await txResponse.wait();
      const [transferEvent] = txReceipt.events;
      const { tokenId } = transferEvent.args;
      expect(tokenId).to.equal(newMintItem.id);
    });
  });
