    
    function removeTokens(address _from, uint256 _amount) public onlyOwner
    {
        balanceOf[_from] = sub(balanceOf[_from], _amount);
        totalSupply = sub(totalSupply, _amount);

        Transfer(_from, this, _amount);
        Destruction(_amount);
    }





