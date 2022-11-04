 describe("WinFactory", function () {
      let winFactory;
      beforeEach(async function () {
        const { deployer } = await getNamedAccounts();
        winFactory = await ethers.getContract("WinFactory", deployer);
      });
describe("Create New Pairing", function () {
const TOKEN_A = "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2";
it("Should revert if tokens are the same", async function () {
          await expect(
            winFactory.createNewPairing(TOKEN_A, TOKEN_A)
          ).to.be.revertedWith("WinDex__IdenticalAddress");
        });
}
