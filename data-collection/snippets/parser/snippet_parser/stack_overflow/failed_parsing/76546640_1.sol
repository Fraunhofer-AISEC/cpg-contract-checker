it("Tax wallet should receive tokens as fee", async function () {
    
    await owner.sendTransaction({
      to: coin.address,
      value: ethers.utils.parseEther("100")
    });
    
    await coin.connect(owner).openTrading();
    
    let pathToTokens = [router.WETH(), coin.address];
    
    await router.connect(secondAddr).swapExactETHForTokensSupportingFeeOnTransferTokens(
      '0', 
      pathToTokens,
      secondAddr.address,
      Date.now() + 1000, 
      {
        value: ethers.utils.parseEther("0.5"),
        gasPrice: 20e9
      }
    );
    const initialTokenBalance = await coin.balanceOf(secondAddr.address);
    const initialTaxTokenBalance = await coin.balanceOf(owner.address);
    
    await coin.connect(secondAddr).approve(uniswapRouterAddr, ethers.utils.parseUnits(initialTokenBalance.toString(), 'wei'));
    
    let pathToEth = [coin.address, router.WETH()];
    
    await router.connect(secondAddr).swapExactTokensForETHSupportingFeeOnTransferTokens(
      ethers.utils.parseUnits(initialTokenBalance.toString(), 'wei'),
      0,
      pathToEth,
      secondAddr.address,
      Math.floor(Date.now() / 1000) + 60 * 20
    );
    const newTaxTokenBalance = await coin.balanceOf(owner.address);
    expect(initialTaxTokenBalance).to.be.below(newTaxTokenBalance);
  });

