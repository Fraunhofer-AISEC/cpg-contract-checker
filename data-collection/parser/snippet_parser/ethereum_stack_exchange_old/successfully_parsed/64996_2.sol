contract IPermissionsManager {  
    function isAdmin(address) public view returns (bool);
}

contract Permissions {    
    IPermissionsManager private permissionsManager;

    constructor(address _permissionsManagerAddress) public {
        permissionsManager = IPermissionsManager(_permissionsManagerAddress);
    }

    function isAdmin(address _who) 
    public
    view
    returns(bool) 
    {
        return permissionsManager.isAdmin(_who);
    }


    modifier onlyAdmin() {
    require(permissionsManager.isAdmin(msg.sender));
    _;
  }
}
