  it('buyer should be able to pay tokens and buy products in one transaction', async () => {
    
    const buySigHash = tokenReceiver.interface.getSighash('buy');
    
    const productAmount = 99;
    const color = '0x121212';
    
    const calldata = ethers.utils.defaultAbiCoder.encode(
      ['bytes4', 'uint256', 'bytes3'],
      [buySigHash, productAmount, color],
    );
    
    const transferAndCallTx = payableToken
      .connect(buyer)
      ['transferAndCall(address,uint256,bytes)'](tokenReceiver.address, tokenAmount, calldata);
    await expect(transferAndCallTx)
      .to.emit(tokenReceiver, 'PurchaseMade');
  });
