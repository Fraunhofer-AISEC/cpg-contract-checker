function tokentransfer(address sender, address receiver) public returns (bool) {
    ERC20Basic instance = ERC20Basic(erc20address);
    instance.transfer(sender,account,1000);
    return true;
}
