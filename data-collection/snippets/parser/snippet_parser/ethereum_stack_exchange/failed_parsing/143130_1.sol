const { expect, assert } = require("chai");
const { ethers, faucet } = require("hardhat");

describe('DeFiBank', function () {
  let deFiBank;
  let usdc;
  let aUsdc;
  let depositors;
  const amount = ethers.utils.parseEther('100');
  
  this.beforeEach(async () => {
    usdc = await ethers.getContractAt("IERC20", "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48");
    aUsdc = await ethers.getContractAt("IERC20", "0x9bA00D6856a4eDF4665BcA2C2309936572473B7E");
    pool = await ethers.getContractAt("ILendingPool", "0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9");

    depositors = (await ethers.provider.listAccounts()).slice(1, 4);

    const DeFiBank = await ethers.getContractFactory("DeFiBank");
    deFiBank = await DeFiBank.deploy(amount);
    await deFiBank.deployed();    

  });

  it('should set the banks take fee', async () => {
    const fee = await deFiBank.fee();
    assert(fee);
  });

  it('should deposit usdc into bank smart contract and update depositors balance', async () => {
    for (let i = 0; i < depositors.length; i++) {
      const signer = await ethers.provider.getSigner(depositors[i]);
      
      await usdc.connect(signer).approve(deFiBank.address, amount);
      
      const initialUsdcBalance = await usdc.balanceOf(depositors[i]);
      
      await deFiBank.connect(signer).deposit({value: amount});
      
      const finalUsdcBalance = await usdc.balanceOf(depositors[i]);
      
      expect.equal(finalUsdcBalance.toString(), (initialUsdcBalance.sub(amount)).toString());
      
      const contractUsdcBalance = await usdc.balanceOf(deFiBank.address);
      expect.equal(contractUsdcBalance.toString(), (contractUsdcBalance.add(amount).toString()));
      
      await assert.reverts(deFiBank.connect(signer).deposit({value: amount}), "transfer of funds failed");
      
      const fee = await deFiBank.fee();
      assert(fee);
      
      const newAmount = amount - fee;
      await usdc.connect(signer).approve(pool.address, newAmount);
      
      await assert.reverts(usdc.connect(signer).approve(pool.address, newAmount), "approval failed");
      
      const contractAUsdcBalance = await aUsdc.balanceOf(deFiBank.address);
      expect((contractAUsdcBalance.gte(newAmount.mul(depositors.length))).toString());
      
      
      const initalBankBalance = await deFiBank.bankBalance(depositors[i]);
      const finalBankBalance = await deFiBank.bankBalance(depositors[i]);
      expect.equal(finalBankBalance.toString(), (initalBankBalance.add(newAmount)).toString());
      
      const depositorAdded = await deFiBank.hasDeposited(depositors[i]);
      assert.isTrue(depositorAdded);
    }
  });
  
  it('should withdrawal Interest and update deopsitors balance', async () => {
    for(let i = 0; i < depositors.length; i++) {
      const signer = await ethers.provider.getSigner(depositors[i]);
      const initBankAusdcBalance = await aUsdc.balanceOf(deFiBank.address);
      const interest = await (aUsdc.balanceOf(deFiBank.address)).sub(initBankAusdcBalance);
      const finBankAusdcBalance = await aUsdc.balanceOf(deFiBank.address);

      
      await aUsdc.connect(signer).approve(pool.address, interest);
      
      await assert.reverts(aUsdc.connect(signer).approve(pool.address, interest), "approval failed");

      
      const withdrawn = await pool.connect(signer).withdrawlInterest({value: interest});
      
      assert.isTrue(withdrawn == interest);
      
      await assert.reverts(pool.connect(signer).withdrawlInterest({value: interest}), "Incorrect amount withdrawn");

      
      expect.equal(finBankAusdcBalance, initBankAusdcBalance.sub(interest));
      
      
      const initDepositorUsdcBalance = await usdc.balanceOf(depositors[i]);
      const finDepositorUsdcBalance = await usdc.balanceOf(depositors[i]);
      expect.equal(finDepositorUsdcBalance, initDepositorUsdcBalance.add(interest));

      
      
      if(interest > 0) {
        const initlBankBalance = await deFiBank.bankBalance(depositors[i]);
        const finBankBalance = await deFiBank.bankBalance(depositors[i]);
        expect.equal(finBankBalance, initlBankBalance.sub(interest));
      }
      
      await pool.connect(signer).withdrawlInterest({value: interest});
      await assert.reverts(pool.connect(signer).withdrawlInterest({value: interest}), "reentrancy detected");
    }
  });

  it('should withdrawl total usdc balance and update depositors bank balance', async () => {
    for(let i = 0; i < depositors.length; i++) {
      const signer = await ethers.provider.getSigner(depositors[i]);
      const initialBankAusdcBalance = await aUsdc.balanceOf(deFiBank.address);
      const interest = await (aUsdc.balanceOf(deFiBank.address)).sub(initialBankAusdcBalance);

      
      await aUsdc.connect(signer).approve(pool.address, (initialBankAusdcBalance + interest));
      
      await assert.reverts(aUsdc.connect(signer).approve(pool.address, (initialBankAusdcBalance + interest), "approval failed"));

      
      const withdrawl = await pool.connect(signer).withdrawlBalance({value: amount + interest});
      
      assert.isTrue(withdrawl == (initialBankAusdcBalance + interest));
      
      await assert.reverts(pool.connect(signer).withdrawlBalance({value: initialBankAusdcBalance}), "Incorrect amount withdrawn");

      
      const finalBankAusdcBalance = await aUsdc.balanceOf(deFiBank.address);
      expect.equal(finalBankAusdcBalance, initialBankAusdcBalance.sub(amount + interest));
      
      
      const initialDepositorUsdcBalance = await usdc.balanceOf(depositors[i]);
      const finalDepositorUsdcBalance = await usdc.balanceOf(depositors[i]);
      expect.equal(finalDepositorUsdcBalance, initialDepositorUsdcBalance.add(amount + interest));

      
      const BankBalance = await deFiBank.bankBalance(depositors[i]);
      expect.equal(bankBalance, 0);
      
      
      
      await pool.connect(signer).withdrawlBalance({value: amount + interest});
      await assert.reverts(pool.connect(signer).withdrawlBalance({value: amount + interest}), "reentrancy detected");
    }
  });
});
