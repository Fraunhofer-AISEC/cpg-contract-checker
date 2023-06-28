function transfer(address recipient, uint256 amount) public override returns (bool) {
    amount = amount.mul(0.8); 
    _transfer(_msgSender(), recipient, amount);
    return true;
}
