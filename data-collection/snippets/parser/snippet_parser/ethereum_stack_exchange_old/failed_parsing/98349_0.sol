contract IToken is ERC20 { 
....
function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal virtual override
{
    super._beforeTokenTransfer(from, to, amount);

    require(amount > 1, "ERC20: invalid transfer amount");
}
