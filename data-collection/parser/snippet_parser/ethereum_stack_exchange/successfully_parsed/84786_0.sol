    function buyTokens(address _wallet,uint256 _amount, uint coin) public
    isOwner
    isEnableToSend(_wallet,_amount, isBuying)
    returns(uint256,uint256)
    {
        _totalSupply = _totalSupply.add(_amount);
        balances[_wallet][coin] = balances[_wallet][coin].add(_amount);
        emit BuyTokens(_wallet,_amount,coin,Time_now());
        return (_totalSupply,balances[_wallet][coin]);
    }
