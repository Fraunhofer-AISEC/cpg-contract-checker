myAddress = 0x0; 

function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
    uint256 fee;
    fee = amount.div(10000);
    _transfer(from, myAddress, fee);
    _transfer(from, to, amount.sub(fee));
return true;
}
