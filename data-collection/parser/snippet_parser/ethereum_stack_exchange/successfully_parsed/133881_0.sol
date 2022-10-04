
abstract contract ERC20Burnable is Context, ERC20 {
    
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

    
    function burnFrom(address account, uint256 amount) public virtual {
        uint256 currentAllowance = allowance(account, _msgSender());
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        _approve(account, _msgSender(), currentAllowance - amount);
        _burn(account, amount);
    }
}

