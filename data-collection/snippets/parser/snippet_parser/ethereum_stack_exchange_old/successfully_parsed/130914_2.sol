library Bits {
  enum Role {
    Reserved00,
    Superuser,
    Minter,
    Caster,
    Transferer
  }

  function roleNameByIndex(Role index)
    public pure returns (string memory name)
  {
    if(index == Role.Superuser) return "Superuser";
    if(index == Role.Minter) return "Minter";
    if(index == Role.Caster) return "Caster";
    if(index == Role.Transferer) return "Transferer";
      }

  function roleValueForName(string memory roleName)
    public pure returns (Role role)
  {
    bytes32 hash = keccak256(abi.encodePacked(roleName));
    if(hash == keccak256(abi.encodePacked('Superuser'))) {
      return Role.Superuser;
    }
    if(hash == keccak256(abi.encodePacked('Minter'))) {
      return Role.Minter;
    }
    if(hash == keccak256(abi.encodePacked('Caster'))) {
      return Role.Caster;
    }
    if(hash == keccak256(abi.encodePacked('Transferer'))) {
      return Role.Transferer;
    }
    revert(string(abi.encodePacked('Unknown role type: ', roleName)));
  }
}
