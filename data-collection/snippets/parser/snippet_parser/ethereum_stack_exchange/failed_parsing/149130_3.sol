  
    describe("getBalance", () => {
        beforeEach(async () => {
            const Token = await ethers.getContractFactory("SampleERC20");
            token = await Token.deploy();
            await token.deployed();
            await token.mint(treasury.address, ethers.utils.parseEther("100"));
        });


        it("should return updated balance after depositing more tokens", async function () {
            await treasury.connect(tokenManager).addAllowedToken(token.address);
            await token.mint(owner.address, ethers.utils.parseEther("50"));
            await token.connect(owner).approve(treasury.address, ethers.utils.parseEther("50"));
            await treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("50"));
            const balance = await treasury.getBalance(token.address);
            expect(balance).to.equal(ethers.utils.parseEther("150"));
        });
    });


    
    describe("deposit", function () {
        let Treasury, treasury, SampleERC20, sampleERC20, SampleERC777, sampleERC777, owner, tokenManager, user1, user2;

        beforeEach(async function () {
            
            [owner, tokenManager, user1, user2] = await ethers.getSigners();

            const initialSupply = ethers.utils.parseUnits("1000");

            Treasury = await ethers.getContractFactory("Treasury");
            treasury = await Treasury.deploy();
            await treasury.deployed();

            SampleERC777 = await ethers.getContractFactory("SampleERC777");
            sampleERC777 = await SampleERC777.deploy(initialSupply, [treasury.address]);
            await sampleERC777.deployed();

            
            await treasury.grantRole(await treasury.TOKEN_MANAGER_ROLE(), tokenManager.address);

            
            await treasury.addAllowedToken(sampleERC20.address);
            await treasury.addAllowedToken(sampleERC777.address);

            
            await sampleERC20.connect(owner).mint(user1.address, ethers.utils.parseEther("100"));
            await sampleERC20.connect(owner).mint(user2.address, ethers.utils.parseEther("100"));
            await sampleERC777.connect(owner).mint(user1.address, ethers.utils.parseEther("100"), "0x", "0x");
            await sampleERC777.connect(owner).mint(user2.address, ethers.utils.parseEther("100"), "0x", "0x");
        });

        it("should deposit ETH successfully", async function () {
            const depositAmount = ethers.utils.parseEther("1");

            await expect(
                treasury.connect(user1).deposit("0x0000000000000000000000000000000000000000", depositAmount, { value: depositAmount })
            ).to.not.be.reverted;

            expect(await ethers.provider.getBalance(treasury.address)).to.equal(depositAmount);
        });

        it("should deposit ERC20 tokens successfully", async function () {
            const depositAmount = ethers.utils.parseEther("10");
            await sampleERC20.connect(user1).approve(treasury.address, depositAmount);
            await treasury.connect(user1).deposit(sampleERC20.address, depositAmount);

            expect(await sampleERC20.balanceOf(treasury.address)).to.equal(depositAmount);
        });

        it("should deposit ERC777 tokens successfully", async () => {
            const depositAmount = ethers.utils.parseUnits("100", 18);
            await sampleERC777.connect(user1).send(treasury.address, depositAmount, "0x");

            const user1TreasuryBalance = await treasury.connect(user1).balanceOf(user1.address);
            expect(user1TreasuryBalance).to.equal(depositAmount);
        });

        it("should emit Deposit event on successful deposit", async () => {
            const amount = ethers.utils.parseUnits("1000", 18);
            await token.connect(owner).approve(treasury.address, amount);
            await token.connect(owner).transfer(user1.address, amount);

            await expect(treasury.connect(user1).deposit(token.address, amount))
                .to.emit(treasury, "Deposit")
                .withArgs(user1.address, token.address, amount);
        });

        it("should revert when trying to deposit non-allowed token", async function () {
            const anotherTokenFactory = await ethers.getContractFactory("SampleERC20");
            const anotherToken = await anotherTokenFactory.deploy();
            await anotherToken.deployed();
            await anotherToken.mint(owner.address, ethers.utils.parseEther("1000"));

            await anotherToken.connect(owner).approve(treasury.address, ethers.utils.parseEther("500"));
            await expect(treasury.connect(owner).deposit(anotherToken.address, ethers.utils.parseEther("500"))).to.be.revertedWith(
                "Treasury: Token not allowed"
            );
        });

        it("should revert when token transfer amount exceeds balance", async () => {
            const treasuryBalanceBefore = await erc20Token.balanceOf(treasury.address);
            await expectRevert(
                treasury.deposit(erc20Token.address, treasuryBalanceBefore.add(new BN("1")), { from: user1 }),
                "ERC20: transfer amount exceeds balance"
            );
        });

        it("should revert when not enough tokens are approved for transfer", async function () {
            const sender = owner;
            const amountToTransfer = ethers.utils.parseEther("100");
            const amountToApprove = ethers.utils.parseEther("50"); 

            await token.connect(sender).approve(treasury.address, amountToApprove);

            await expect(treasury.connect(sender).deposit(token.address, amountToTransfer))
                .to.be.revertedWith("SafeERC20: low-level call failed"); 
        });

        it("should revert when token transfer fails", async function () {
            await token.connect(owner).approve(treasury.address, ethers.utils.parseEther("500"));
            await expect(treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("1500"))).to.be.revertedWith(
                "ERC20: transfer amount exceeds balance"
            );
        });

        it("should revert when trying to deposit a zero amount", async function () {
            await token.connect(owner).approve(treasury.address, ethers.utils.parseEther("500"));
            await expect(treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("0"))).to.be.revertedWith(
                "Treasury: Deposit amount must be greater than zero"
            );
        });

        it("should revert when trying to deposit an amount greater than approved", async function () {
            await token.connect(owner).approve(treasury.address, ethers.utils.parseEther("400"));
            await expect(treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("500"))).to.be.revertedWith(
                "ERC20: transfer amount exceeds allowance"
            );
        });

        it("should correctly update the treasury balance after multiple deposits", async function () {
            
            await token.connect(owner).approve(treasury.address, ethers.utils.parseEther("1000"));
            await treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("300"));
            await treasury.connect(owner).deposit(token.address, ethers.utils.parseEther("200"));
            const balance = await treasury.getBalance(token.address);
            expect(balance).to.equal(ethers.utils.parseEther("500"));
        });
    });
