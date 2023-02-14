    function approve(address spender, uint256 amount) public virtual override returns (bool) {
      allowed[msg.sender][spender] = amount;
      emit Approval(msg.sender, spender, amount);
      return true;
    }
