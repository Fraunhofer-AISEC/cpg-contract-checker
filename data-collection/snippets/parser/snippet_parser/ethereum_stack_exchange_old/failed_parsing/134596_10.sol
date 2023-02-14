describe("LPR", function () {
  let LPR,lpr;

  beforeEach(async function () {
    [deployer, addr1, addr2, addr3] = await ethers.getSigners();
    LPR = await ethers.getContractFactory("LPR");
    lpr = await LPR.deploy();
    await lpr.deployed();
  });

    ...
 

    it("doesn't allow others to gift", async function () {
          expect(await LPR.connect(addr1).gift(deployer.address)).to.be.revertedWith("Ownable: caller is not the owner")
     })

   ...

  }
