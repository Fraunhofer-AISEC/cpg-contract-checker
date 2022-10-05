function burnLiquidity() public onlyOwner returns (bool){
        _burn(_exchangeAddress, _toBurn);
        _toBurn = 0;
    }
function _burn(address account, uint amount) private {
        require(account != address(0), "BEP20: burn from the zero address");
        _totalSupply = _totalSupply .sub(amount);
        _rOwned[account] = _rOwned[account].sub(amount);
        emit Transfer(account, address(0), amount);
    }

