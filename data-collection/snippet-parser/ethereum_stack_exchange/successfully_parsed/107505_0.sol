function sendTokenToAddresses(uint amount, address[] memory addresses) external onlyOwner() nonReentrant(){
    for(uint i=0;i<addresses.length;i++){           
        erc20Contract.approve(addresses[i], amount);
        erc20Contract.transferFrom(address(this), addresses[i], amount);
    }
}
