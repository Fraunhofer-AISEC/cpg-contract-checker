    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
    require(!AntiSnipeDenyList[from] && !AntiSnipeDenyList[to], "AntiSnipe: address is on denylist");
    address spender = _msgSender();
    _spendAllowance(from, spender, amount);

        uint256 lp_tax_amount = 0;
        uint256 dev_tax_amount = 0;
        uint256 marketing_tax_amount = 0;
        uint256 transfer_amount;

    if(
         msg.sender != _contractDeployer
        && msg.sender != owner()
        && msg.sender != _uniswapV2RouterAddress
        && to != address(this)
        && from != address(this)
    )
    {   
        
        
        lp_tax_amount = (amount * _lpTax)/100;
        dev_tax_amount = (amount * _devTax)/100;
        marketing_tax_amount = (amount * _marketingTax)/100;

        
        transfer_amount = amount - lp_tax_amount - dev_tax_amount - marketing_tax_amount;

        
        uint256 wallet_size = balanceOf(to);
        require((wallet_size + transfer_amount) <= _maxWallet, "IBIT: maximum wallet cannot be exceeded");

        
        
        

        if(block.timestamp < deploy + 60){
           AntiSnipeDenyList[to] = true;
        }
       
    }
    else
    {
        transfer_amount = amount;
    }

    if(marketing_tax_amount > 0)
    {
        _transfer(from, _marketingWallet, marketing_tax_amount);
    }

    if(dev_tax_amount > 0)
    {
       _transfer(from, _devWallet, dev_tax_amount);
    }

    if(lp_tax_amount > 0)
    {
        _transfer(from, _lpWallet, lp_tax_amount);
    }

    _transfer(from, to, transfer_amount);
    return true;
}
