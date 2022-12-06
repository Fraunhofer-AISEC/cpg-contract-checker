it('external contract sucessfully completed', async() => {
      const amount = ethers.utils.parseEther('1.1');
      await stakerContract.connect(addr1).stake({
        value :amount,
      });
      await stakerContract.connect(addr1).execute();

      const competed = await exampleExternalContract.completed();
      expect(competed).to.equal(true);

      const externalBalance = await ethers.provider.getBalance(exampleExternalContract.address);
      expect(externalBalance).to.equal(amount);

      const stakerContractbalance = await ethers.provider.getBalance(stakerContract.address);
   --(★)confuing witch this line(why stakerContractbalance is 0?)           
  expect(stakerContractbalance).to.equal(0); 

});
