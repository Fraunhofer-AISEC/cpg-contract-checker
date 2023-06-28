  function roleNameByIndex(Role index)
    public pure returns (string memory name)
  {
    if(index == Role.Superuser) return "Superuser";
    if(index == Role.Minter) return "Minter";
    if(index == Role.Caster) return "Caster";
      
  }
