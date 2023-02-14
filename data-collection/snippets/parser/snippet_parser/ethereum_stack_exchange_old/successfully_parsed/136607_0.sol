function _burn(address from , uint256 amount) internal {
        require(from != address(0), "ERC20: burn from the zero address");
        require(_tOwned[from] >= amount ,"ERC20: burn amount exceeds balance");
        uint256 _tOwnedFrom = _tOwned[from];
        _tOwnedFrom = _tOwnedFrom.sub(amount);
        _rTotal = _rTotal.sub(amount);
        emit Transfer(from, address(0), amount);
    } 
