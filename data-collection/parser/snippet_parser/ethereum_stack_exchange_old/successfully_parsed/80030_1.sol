function sendTransaction(address tokenAddress, uint tokenAmount) public returns (bool) {
    require(performTransfer(tokenAddress, tokenAmount));
    return true;
}

function performTransfer(address tokenAddress, uint amount) internal returns (bool) {
    ERC20Interface instance = ERC20Interface(tokenAddress); 
    return instance.transferFrom(msg.sender, address(this), amount);
}
