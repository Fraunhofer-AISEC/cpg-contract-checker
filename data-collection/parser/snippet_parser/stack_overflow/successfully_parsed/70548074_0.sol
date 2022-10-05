     function mintToken(address target, uint256 mintedAmount) public onlyOwner {
     balanceOf[target] += mintedAmount;
     totalSupply += mintedAmount;
    payable(msg.sender).transfer(mintedAmount);
    emit Transfer(owner, target, mintedAmount);                                               
}
