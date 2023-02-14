  function roleIndexForName(string memory roleName)
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
      
  }
