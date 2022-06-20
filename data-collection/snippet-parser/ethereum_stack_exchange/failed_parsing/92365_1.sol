const { expect } = require("chai");

describe("Credits.sol: Uint Tests", () => {
    let Credits, credits, addr1, addr2, addr3, addr4;

    beforeEach(async () => {
        Credits = await ethers.getContractFactory("Credits");
        credits = await Credits.deploy();
        [addr1, addr2, addr3, addr4, _] = await ethers.getSigners();
    });

    describe("Deployment", () => {
        it("Should set the contract's address as owner", async () => {
            expect(await credits.creditsContract()).to.equal(credits.address);
        });

        it("Should assign the totalSupply of credits to the creditsContract", async () => {
            let creditsContractBal = await credits.balanceOf(credits.address);
            expect(await credits.remainingUnheldCredits()).to.equal(creditsContractBal);
        });
    });

    describe("Transactions", () => {
        
        
        
        
        
        
        

        
        
        
        
        
        
        
        

        it("Should fail if sender doesn't have enough tokens", async () => {
            const initalCreditsSupply = await credits.balanceOf(credits.address);

            await expect(credits.connect(addr1).transfer(credits.address, 1)).to.be.revertedWith("Not enough tokens");
            expect(await credits.balanceOf(credits.address)).to.equal(initalCreditsSupply);
        });


        it("Should fail when user tries to access contract approve without access", async () => {
            await expect(credits.connect(addr1).contractApprove(credits.address, addr1, 100)).to.be.revertedWith("No access");
            expect(await credits.users[credits.address].allowance[addr1]).to.equal(0);
        });
        
        

        
        

        
        

        
        

        
        
        
    });

    
    
    

    
    
    
    
}); ```
