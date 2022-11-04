 token.approve(address(acsiVault), amountToken);

    uint amountRequired = PancakeLibrary.getAmountsIn(
      pcsFactory, 
      amountToken, 
      path
    )[0];

