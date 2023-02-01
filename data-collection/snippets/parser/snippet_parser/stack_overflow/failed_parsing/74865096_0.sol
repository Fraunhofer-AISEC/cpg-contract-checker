const { expect } = require("chai");
const hre = require("hardhat");

describe("JaiToken contract", function() {

    let Token;
    let jaiToken;
    let owner;
    let addr1;
    let addr2;
    let tokenCap = 50000000;
    let tokenBlockReward = 20;

    beforeEach(async function () {

        Token = await ethers.getContractFactory("JaiToken");
        [owner, addr1, addr2] = await hre.ethers.getSigners();

        jaiToken = await Token.deploy(tokenCap, tokenBlockReward);
    });

    describe("Deployment", function () {
        it("Should set the right owner", async function () {
          expect(await jaiToken.owner()).to.equal(owner.address);
        });
     
        it("Should assign the total supply of tokens to the owner", async function () {
          const ownerBalance = await jaiToken.balanceOf(owner.address);
          expect(await jaiToken.totalSupply()).to.equal(ownerBalance);
        });
    
        it("Should set the max capped supply to the argument provided during deployment", async function () {
          const cap = await jaiToken.cap();
          expect(Number(hre.ethers.utils.formatEther(cap))).to.equal(tokenCap);
        });
    
        it("Should set the blockReward to the argument provided during deployment", async function () {
          const blockReward = await jaiToken.blockReward();
          expect(Number(hre.ethers.utils.formatEther(blockReward))).to.equal(tokenBlockReward);
        });
      });

      describe("Transactions", function () {
        it("Should transfer tokens between accounts", async function () {
          
          await jaiToken.transfer(addr1.address, 50);
          const addr1Balance = await jaiToken.balanceOf(addr1.address);
          expect(addr1Balance).to.equal(50);

          
          
          await jaiToken.connect(addr1).transfer(addr2.address, 50);
          const addr2Balance = await jaiToken.balanceOf(addr2.address);
          expect(addr2Balance).to.equal(50);
        });

        it("Should fail if sender doesn't have enough tokens", async function () {
          const initialOwnerBalance = await jaiToken.balanceOf(owner.address);
          
          
          await expect(
            jaiToken.connect(addr1).transfer(owner.address, 1)
          ).to.be.revertedWith("ERC20: transfer amount exceeds balance");

          
          expect(await jaiToken.balanceOf(owner.address)).to.equal(
            initialOwnerBalance
          );
        });

        it("Should update balances after transfers", async function () {
          const initialOwnerBalance = await jaiToken.balanceOf(owner.address);

          
          await jaiToken.transfer(addr1.address, 100);

          
          await jaiToken.transfer(addr2.address, 50);

          
          const finalOwnerBalance = await jaiToken.balanceOf(owner.address);
          expect(finalOwnerBalance).to.equal(initialOwnerBalance.sub(150));

          const addr1Balance = await jaiToken.balanceOf(addr1.address);
          expect(addr1Balance).to.equal(100);

          const addr2Balance = await jaiToken.balanceOf(addr2.address);
          expect(addr2Balance).to.equal(50);
      });
    });

  });
