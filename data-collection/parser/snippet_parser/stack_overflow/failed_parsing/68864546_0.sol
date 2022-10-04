  approveAddLiquidity = async (
    dexAddress: string,
    tokenAmount: string,
    ethAmount: string
  ) => {
    const exchange = await this.getExchange(dexAddress);

    await this.state.token.approve(dexAddress, tokenAmount, {
      from: this.state.account,
    }); 

    const tx = await exchange.addLiquidity(tokenAmount, {
      value: ethAmount,
      from: this.state.account,
    });
    await tx.wait(1);
    return tx;
  };
