it('should invoke the fallback function', async () => {
    const nonExistentFuncSignature = 'nonExistentFunc(uint256,uint256)';
    const fakeDemoContract = new ethers.Contract(
      demoContract.address,
      [
        ...demoContract.interface.fragments,
        `function ${nonExistentFuncSignature}`,
      ],
      deployer,
    );
    const tx = fakeDemoContract[nonExistentFuncSignature](8, 9);
    await expect(tx)
      .to.emit(demoContract, 'Error')
      .withArgs('call of a non-existent function');
 });
