function withdrawWithPermit(
  address token,
  uint liquidity,
  uint amountMin,
  address to,
  uint deadline,
  bool approveMax, uint8 v, bytes32 r, bytes32 s
) external virtual override returns (uint amount) {
    address pool = ISafepayFactory(factory).getPool(token);
    require(pool != address(0), 'SFPY_ROUTER: UNSUPPORTED POOL');
    uint value = approveMax ? uint(-1) : liquidity;
    ISafepayPool(pool).permit(msg.sender, address(this), value, deadline, v, r, s);
    amount = withdraw(token, liquidity, amountMin, to, deadline);
}
