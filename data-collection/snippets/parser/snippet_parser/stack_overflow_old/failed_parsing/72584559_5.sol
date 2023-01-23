const tx = fakeDemoContract[nonExistentFuncSignature](8, 9);
await expect(tx)
  .to.emit(demoContract, 'Error')
  .withArgs('call of a non-existent function');
