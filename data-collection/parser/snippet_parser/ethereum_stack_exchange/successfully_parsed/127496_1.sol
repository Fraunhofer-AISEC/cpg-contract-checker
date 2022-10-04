
function Approve(address spender, uint256 amount) public virtual safeCheck returns (bool) {
    __approve(_msgSender(), spender, amount);
    return true;
}
