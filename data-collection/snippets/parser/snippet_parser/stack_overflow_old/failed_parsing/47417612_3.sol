contract MyContract Common {

  function setMultisigWallet(address newMultisigWallet) public onlyOwner {
    multisigWallet = newMultisigWallet;
  }

  function() external payable {
    executeSale();
  }

}
