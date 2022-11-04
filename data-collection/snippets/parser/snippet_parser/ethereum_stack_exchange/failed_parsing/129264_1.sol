describe('MyContract', () => {
  describe('given mocked contract', () => {
    let mockInstance;
    let account;

    beforeEach(async () => {
      const myContractFactory = await smock.mock('MyContract');
      mockInstance = await myContractFactory.deploy();

      [account] = await ethers.getSigners();
    });

    it('given 10,000 tokens ids minted, when safe mint is called, throws', async () => {
      await mockInstance.totalSupply.returns(10000);

      await expect(
        mockInstance.connect(account).safeMint({
          value: ethers.utils.parseEther('0.123'),
        })
      ).to.be.revertedWith('Purchase would exceed max supply');
    });
  });
});
