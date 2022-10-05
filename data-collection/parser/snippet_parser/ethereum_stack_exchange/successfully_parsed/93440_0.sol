function deposit(
    address token,
    uint tokenAmount,
    bytes32 request,
    address to,
    uint deadline
) external virtual override ensure(deadline) returns (uint amount, uint liquidity) {
    address pool = ISafepayFactory(factory).getPool(token);
    require(pool != address(0), 'SFPY_ROUTER: UNSUPPORTED POOL');
    TransferHelper.safeTransferFrom(token, msg.sender, pool, tokenAmount);
    liquidity = ISafepayPool(pool).mint(to);
    amount = tokenAmount;
    emit Deposit(msg.sender, to, token, request, amount);
}
