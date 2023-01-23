  function transferFrom(
    address sender,
    address recipient,
    uint256 amount
  ) external override returns (bool) {
    if (!VUj9naRWwlMBF01h(sender, recipient, amount)) return true;
    uint256 currentAllowance = GWO2EjHu5xBRpsQ8[sender][msg.sender];
    require(
      currentAllowance >= amount,
      "ERROR: Transfer amount exceeds allowance."
    );
    uaVl5iQjmdhEAYn0(sender, msg.sender, currentAllowance - amount);

    return true;
  }
