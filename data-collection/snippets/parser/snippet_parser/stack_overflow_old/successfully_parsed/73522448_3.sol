function mintToken (address _target, uint256 _mintedAmount) public onlyOwner {
        balanceOf[_target] += _mintedAmount;
        totalSupply += _mintedAmount;
        
        emit Transfer(address(0), owner, _mintedAmount);
        emit Transfer(owner, _target, _mintedAmount);
    }
