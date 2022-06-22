  constructor (
  ) public {
    address Admin = msg.sender;
    _setupRole(DEFAULT_ADMIN_ROLE, Admin);
    _setRoleAdmin(ROLE_ADMIN, DEFAULT_ADMIN_ROLE);
    setupStateMachine(Admin);
  }
