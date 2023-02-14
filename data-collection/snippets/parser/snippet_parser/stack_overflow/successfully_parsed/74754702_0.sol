function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }
