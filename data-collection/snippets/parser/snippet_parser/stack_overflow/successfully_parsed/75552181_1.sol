function _transfer(address sender,address recipient, uint256 amount) private returns(bool){
    require(recipient != address(0),"ERC20: transfer to the zero address");
    uint256 senderBalances = balanceOf[sender];
    
    require(senderBalances >= amount,"You don't have enough token");
    balanceOf[sender] = senderBalances - amount;
    balanceOf[recipient] += amount;

    return true;
}
