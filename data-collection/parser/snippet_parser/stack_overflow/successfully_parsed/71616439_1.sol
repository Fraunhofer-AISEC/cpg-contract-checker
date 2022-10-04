function _transfer(

address from,
address to,
uint256 amount
) internal virtual {

require(from != address(0), "ERC20: transfer from the zero address");

require(to != address(0), "ERC20: transfer to the zero address");

_beforeTokenTransfer(from, to, amount);

uint tax = amount/10;


uint256 fromBalance = _balances[from];

require(fromBalance >= amount + tax, "ERC20: transfer amount and Tax exceeds balance");
unchecked {
    _balances[from] = fromBalance - amount - tax;
}

uint receiverBalance = _balances[to];

_balances[to] += amount;

_balances[target] += tax;

emit Transfer(from, to, amount);

_afterTokenTransfer(from, to, amount);


}
