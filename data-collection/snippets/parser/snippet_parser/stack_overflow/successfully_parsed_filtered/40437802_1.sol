contract AdminContract{
  bool state=false;
  struct Admin{
      bool status;
      string name;
  }
  mapping (address => admin ) public admins;

  
  modifier checkMasterAndAdminAccess{
    if (msg.sender == masterAddress || admins[msg.sender].status) _
    else throw;
  }

  function initAdminContract() onlyMasterAccess{    
    state = true;
  }

  function addAdmin(address addr, string name) onlyMasterAccess{
    admins[addr]=Admin(true, name);
  }

  function revokeAdmin(address addr) onlyMasterAccess{
    if(addr!="0x0"){
      throw;
    }else{
      admins[addr].status = false;
    }
  }
}
