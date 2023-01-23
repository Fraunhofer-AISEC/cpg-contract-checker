function _mint(
    address to,
    uint256 id,
    uint256 amount,
    bytes memory data
) internal virtual {
    require(to != address(0), "ERC1155: mint to the zero address");

    address operator = _msgSender();
    uint256[] memory ids = _asSingletonArray(id);
    uint256[] memory amounts = _asSingletonArray(amount);

    _beforeTokenTransfer(operator, address(0), to, ids, amounts, data);

    _balances[id][to] += amount;
    emit TransferSingle(operator, address(0), to, id, amount);

    _doSafeTransferAcceptanceCheck(operator, address(0), to, id, amount, data);

    _afterTokenTransfer(operator, address(0), to, ids, amounts, data);
}

function _burn(
    address from,
    uint256 id,
    uint256 amount
) internal virtual {
    require(from != address(0), "ERC1155: burn from the zero address");

    address operator = _msgSender();
    uint256[] memory ids = _asSingletonArray(id);
    uint256[] memory amounts = _asSingletonArray(amount);

    _beforeTokenTransfer(operator, from, address(0), ids, amounts, "");

    uint256 fromBalance = _balances[id][from];
    require(fromBalance >= amount, "ERC1155: burn amount exceeds balance");
    unchecked {
        _balances[id][from] = fromBalance - amount;
    }

    emit TransferSingle(operator, from, address(0), id, amount);

    _afterTokenTransfer(operator, from, address(0), ids, amounts, "");
}
