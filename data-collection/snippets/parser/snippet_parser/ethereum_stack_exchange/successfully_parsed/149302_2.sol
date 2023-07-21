function approveNFTContract(address owner, uint amount) public notPaused returns (bool){
    _approve(owner, msg.sender, amount);
    return true;
}
