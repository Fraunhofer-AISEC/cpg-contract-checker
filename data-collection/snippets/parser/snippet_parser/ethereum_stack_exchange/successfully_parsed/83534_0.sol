  struct Role {
    mapping (address => bool) bearer;
  }

  function add(Role storage role, address account) internal {
    require(account != address(0), "The account cannot be an uninitialized address");
    require(!has(role, account)); 

    role.bearer[account] = true;
  }
