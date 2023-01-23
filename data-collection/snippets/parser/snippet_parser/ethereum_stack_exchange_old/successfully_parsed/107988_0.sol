function transfer(address recipient, uint256 amount)
    public
    override
    returns (bool)
{
    uint256 burnAmt = amount.mul(_burnFee) / 100; 
    _transfer(_msgSender(), recipient, amount.sub(burnAmt)); 
    _tTotal -= burnAmt; 
    Transfer(_msgSender(), address(0), burnAmt); 

    return true;
}

