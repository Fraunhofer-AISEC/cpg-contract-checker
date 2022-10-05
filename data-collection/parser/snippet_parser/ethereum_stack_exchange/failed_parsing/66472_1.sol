contract B {
  using Roles for Roles.Role;
  Roles.Role private adminRole;

  constructor(address _adminRole) public {
    adminRole.add(_adminRole);
  }

  function protectedFunc() public {
    require(adminRole.has(msg.sender), "DOES_NOT_HAVE_ADMIN_ROLE");
    ...
  }

}
