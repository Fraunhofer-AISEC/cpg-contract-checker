function sendTransaction(address tokenAddress, uint tokenAmount) public payable {
    if (!performTransfer(tokenAddress, tokenAmount)) {
        revert();
    }

function performTransfer(address tokenAddress, uint amount) internal returns (bool) {
    ERC20Interface instance = ERC20Interface(tokenAddress); 
    bool resp = instance.transferFrom(msg.sender, address(this), amount); 
    return resp;
}
