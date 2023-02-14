it('Should return a correct ID of the newly minted item', async () => {
    const newMintItem = {
        id: 1,
        uri: 'ipfs://Qme3QxqsJih5psasse4d2FFLFLwaKx7wHXW3Topk3Q8b14',
    };

    
    await expect(myNFT.mintNFT(deployer.address, newMintItem.uri))
        .to.emit(myNFT, "NFTMinted")
        .withArgs(newMintItem.id);

    
    const counter = await myNFT._counter();
    expect(counter).to.equal(newMintItem.id);
});
