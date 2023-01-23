solidity ^0.4.24;
function has(Role storage role, address account) internal view returns (bool) {
    require(account != address(0));
    return role.bearer[account];
  }
